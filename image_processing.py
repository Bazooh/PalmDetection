from concurrent import futures
import numpy as np
from server.grpc_generated import service_pb2_grpc
from server.grpc_generated import service_pb2
from model import dual_model, simple_model
import tensorflow as tf
from preprocessing import preprocess_image
from data import get_data
from rembg import remove
from score import get_compatibility, get_best_idx_compatibility
import cv2


base_model = simple_model

model = dual_model((100, 100, 3), base_model)
model.load_weights('models/weights.49-0.34.weights.h5')

data, train_indices, test_indices, val_indices, persons = get_data(img_size=(100, 100), preprocessing='None')
data = base_model.predict(tf.convert_to_tensor(data))

persons_indices = train_indices
for i, person in enumerate(test_indices):
    persons_indices[i].extend(person)
for i, person in enumerate(val_indices):
    persons_indices[i].extend(person)

added_data = []
added_persons = []


class ImageProcessingService(service_pb2_grpc.ImageProcessingService):
    def _GetImageData(self, image_info):
        print(image_info.width, image_info.height, len(image_info.bytes))
        
        image = np.zeros((image_info.height, image_info.width, 4), dtype=np.uint8)
        for i, pixel in enumerate(image_info.bytes):
            alpha = (pixel >> 24) & 0xFF
            red = (pixel >> 16) & 0xFF
            green = (pixel >> 8) & 0xFF
            blue = pixel & 0xFF
            image[i // image_info.width, i % image_info.width] = [red, green, blue, alpha]
        
        print('Image loaded')
        image = cv2.resize(image, (100, 100))
        print('Image resized')
        image = remove(image)
        print('Image removed background')
        cv2.imwrite('temp.png', image[:, :, :-1])
        image_data = simple_model.predict(np.expand_dims(image[:, :, :-1], axis=0))
        
        return image_data
    
    
    def GetImageOwner(self, request, context):
        print('Getting image owner')
        
        image_data = self._GetImageData(request)
        
        owner_idx, probability = get_best_idx_compatibility(data, persons_indices, image_data, method='max')

        confidence = service_pb2.Confidence(
            result = probability > 0.5,
            probability = probability,
        )
        owner = persons[owner_idx]
        
        print(f'Owner: {owner}, Confidence: {probability}')
        
        return service_pb2.ImageOwner(owner=owner, confidence=confidence)
    
    
    def AddImageToDatabase(self, request, context):
        global data, persons, persons_indices
        
        print('Adding image to database')
        
        image_data = self._GetImageData(request.image)
        
        data = np.concatenate([data, image_data], axis=0)
        persons.append(request.owner)
        persons_indices.append([len(data) - 1])
        
        print(f'Added image to database for {request.owner}')
        
        return service_pb2.Empty()
    
    
    def IsImageOwnedByOwner(self, request, context):
        print('Checking if image is owned by owner')
        
        image_data = self._GetImageData(request.image)
        owner = request.owner
        
        owner_idx = persons.index(owner)
        probability = get_compatibility(data, persons_indices[owner_idx], image_data, method='max')
        is_owned = service_pb2.Confidence(
            result = probability > 0.5,
            probability = probability,
        )
        
        print(f'Is owned by {owner}: {probability}')
        
        return is_owned
    
    
    def GetHandOwners(self, request, context):
        return service_pb2.HandOwners(names = persons)
    
    
    def ResetHandOwners(self, request, context):
        global data, persons, persons_indices
        
        print('Resetting hand owners')
        
        data, train_indices, test_indices, val_indices, persons = get_data(img_size=(100, 100), preprocessing='None')
        data = base_model.predict(tf.convert_to_tensor(data))

        persons_indices = train_indices
        for i, person in enumerate(test_indices):
            persons_indices[i].extend(person)
        for i, person in enumerate(val_indices):
            persons_indices[i].extend(person)
        
        print('Reset hand owners')
        
        return service_pb2.Empty()