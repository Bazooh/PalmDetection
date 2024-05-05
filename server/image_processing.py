from concurrent import futures
import numpy as np
from grpc_generated import service_pb2_grpc
from grpc_generated import service_pb2
import cv2

class ImageProcessingService(service_pb2_grpc.ImageProcessingService):
    def GetImageOwner(self, request, context):
        image_data = request.data
        
        is_in_database = False  # TODO : Implement this
        owner = "Unknown"  # TODO : Implement this
        
        service_pb2.ImageOwner(is_in_database=is_in_database, owner=owner)
    
    
    def GetImageData(self, request, context):
        image = np.zeros((request.width, request.height, 3), dtype=np.uint8)
        for i, pixel in enumerate(request.bytes):
            alpha = (pixel >> 24) & 0xFF
            red = (pixel >> 16) & 0xFF
            green = (pixel >> 8) & 0xFF
            blue = pixel & 0xFF
            image[i // request.height, i % request.height] = [red, green, blue]
        
        image_data = np.random.rand(128) # TODO : Implement this
        
        return service_pb2.ImageData(data=image_data)