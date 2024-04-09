# import numpy as np
# import cv2 as cv

# # Initialises a video capture object from OpenCV2 to capture the video feed
# cap = cv.VideoCapture(0) # 0 Captures from the default camera

# # Check the camera is open
# if not cap.isOpened():
#     print("Cannot open camera")
#     exit()

# # Capture the video
# while True:
#     # Capture frame-by-frame
#     return_value, captured_frame = cap.read() # Return value determines if there was a problem reading the current frame
    
#     # If the return_value is false, that means that the frame had problems reading and the capture should end.
#     if not return_value:
#         print("Can't receive frame (stream end?). Exiting ...")
#         break

#     # Change the captured frame as needed
#     captured_frame = cv.flip(captured_frame, 1) # Mirrors the video feed.
#     grayscaled_captured_frame = cv.cvtColor(captured_frame, cv.COLOR_BGR2GRAY) #Converts the feed into grayscale
    

#     # Display the resulting frame
#     cv.imshow('frame', captured_frame)
#     if cv.waitKey(1) == ord('q'):
#         break

# # When everything done, release the capture
# cap.release()
# cv.destroyAllWindows()



# import numpy as np
# import cv2 as cv


# class Camera:
#     def __init__(self):
#         cap = cv.VideoCapture(0)
#         if not cap.isOpened():
#             print("Cannot open camera")
#             exit()

#         # For saving frames
#         save_frames = False
#         frame_counter = 0

#         while True:
#             ret, frame = cap.read()
#             if not ret:
#                 print("Can't receive frame (stream end?). Exiting ...")
#                 break

#             gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
#             frame = cv.flip(gray, 1)

#             # Show the frame
#             cv.imshow('frame', frame)

#             # Increment the frame counter
#             frame_counter += 1

#             # Check for 's' key to toggle saving frames
#             key = cv.waitKey(1)

#             # Toggle the save_frames state to be False or True
#             if key == ord('s'):
#                 if save_frames == False:
#                     save_frames = True
#                 elif save_frames == True:
#                     save_frames = False
        
#             elif key == ord('q'):
#                 break

#             # If the state is triggered to save the current frame, then run the save frame method
#             if save_frames:
#                 self.save_frame(frame, frame_counter)

#         # Release the capture and destroy windows
#         cap.release()
#         cv.destroyAllWindows()

#     def save_frame(self, frame, frame_counter):
#         # Save every 30th frame if save_frames is True
#         if frame_counter % 30 == 0:
#             cv.imwrite(f"screen_capture{frame_counter}.jpg", frame)  # Save frame



import numpy as np
import cv2 as cv

class Camera:
    def __init__(self):
        self.cap = cv.VideoCapture(0)
        if not self.cap.isOpened():
            print("Cannot open camera")
            exit()

    def get_frame(self, in_grayscale=False):
        ret, frame = self.cap.read()
        if not ret:
            print("Problem reading frame. Exiting.")
            return None
        if in_grayscale:
            frame = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
        frame = cv.flip(frame, 1)
        return frame

    def release(self):
        self.cap.release()

# if __name__ == "__main__":
#     camera = Camera()