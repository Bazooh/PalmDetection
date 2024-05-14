from concurrent import futures
import numpy as np
from server.grpc_generated import service_pb2_grpc
from server.grpc_generated import service_pb2
from model import dual_model, simple_model, prediction_layer


model = dual_model((100, 100, 3), simple_model)
model.load_weights('models/model.keras')


class ImageProcessingService(service_pb2_grpc.ImageProcessingService):
    def GetImageOwner(self, request, context):
        image_data = request.image.data
        dataset = request.dataset.images
        owners = request.dataset.owners
        
        predictions = []
        for image in dataset:
            predictions.append(prediction_layer([image_data, image.data]))
        
        best = np.argmax(predictions)
        
        probability = predictions[best]
        is_in_database = probability > 0.5
        owner = owners[best]
        
        return service_pb2.ImageOwner(is_in_database=is_in_database, owner=owner, probability=probability)
    
    
    def GetImageData(self, request, context):
        image = np.zeros((request.width, request.height, 3), dtype=np.uint8)
        for i, pixel in enumerate(request.bytes):
            alpha = (pixel >> 24) & 0xFF
            red = (pixel >> 16) & 0xFF
            green = (pixel >> 8) & 0xFF
            blue = pixel & 0xFF
            image[i // request.height, i % request.height] = [red, green, blue]
        
        image_data = simple_model.predict(np.expand_dims(image, axis=0))[0]
        print(image_data.shape)
        
        return service_pb2.ImageData(data=image_data)