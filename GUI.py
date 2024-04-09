import tkinter as tk
from PIL import Image, ImageTk
import cv2 as cv

# class GUI:
    
#     def __init__(self, frame):

        # self.frame = frame

        # # Set up the main window
        # root = tk.Tk()
        # root.geometry("1800x1080")
        # root.title("Palmprint Identification System")

        # # Frame for the webcam feed
        # camera_frame = tk.LabelFrame(root, width=1000, height=720)
        # camera_frame.grid(row=0, column=0, padx=10, pady=10)
        # camera_frame.grid_propagate(False)  # Prevents the frame from resizing to fit the labels

        # # Frame for the identification/training status and palmprint addition
        # add_palmprint_frame = tk.LabelFrame(root, width=400, height=720)
        # add_palmprint_frame.grid(row=0, column=1, padx=10, pady=10, sticky="n")
        # add_palmprint_frame.grid_propagate(False)

        # # Placeholder for the identification/training status
        # status_label = tk.Label(add_palmprint_frame, text="(Identification Mode/Training Mode Status Here)", bg='lightgrey')
        # status_label.place(x=0, y=0, width=400, height=40)

        # # Entry field for new palmprint name
        # name_label = tk.Label(add_palmprint_frame, text="Name:")
        # name_label.place(x=10, y=360)  # Adjusted to be at 50% height and aligned with entry and button
        # name_entry = tk.Entry(add_palmprint_frame)
        # name_entry.place(x=70, y=360, width=320)  # Width adjusted for consistency with the label's new position

        # # Button to start the capture process
        # capture_button = tk.Button(add_palmprint_frame, text="Add Palmprint", command=self.add_palmprint)
        # capture_button.place(x=150, y=400)  # Positioned below the name entry

#         root.mainloop()


#     def add_palmprint():
#         # Implement capture functionality here
#         pass



import tkinter as tk
from PIL import Image, ImageTk
import cv2 as cv

class GUI:
    def __init__(self, camera):
        self.camera = camera

        root = tk.Tk()
        root.geometry("1800x1080")
        root.title("Palmprint Identification System")

        # Frame for the webcam feed
        self.camera_frame = tk.LabelFrame(root, width=1000, height=720)
        self.camera_frame.grid(row=0, column=0, padx=10, pady=10)
        self.camera_frame.grid_propagate(False)

        # Frame for the identification/training status and palmprint addition
        self.add_palmprint_frame = tk.LabelFrame(root, width=400, height=720)
        self.add_palmprint_frame.grid(row=0, column=1, padx=10, pady=10, sticky="n")
        self.add_palmprint_frame.grid_propagate(False)

        # Placeholder for the identification/training status
        self.status_label = tk.Label(self.add_palmprint_frame, text="(Identification Mode/Training Mode Status Here)", bg='lightgrey')
        self.status_label.place(x=0, y=0, width=400, height=40)

        # Entry field for new palmprint name
        self.name_label = tk.Label(self.add_palmprint_frame, text="Name:")
        self.name_label.place(x=10, y=360)
        self.name_entry = tk.Entry(self.add_palmprint_frame)
        self.name_entry.place(x=70, y=360, width=320)

        # Button to start the capture process
        capture_button = tk.Button(self.add_palmprint_frame, text="Add Palmprint", command=self.add_palmprint)
        capture_button.place(x=150, y=400)  # Positioned below the name entry


        # Initializing the label for camera feed with a placeholder image or blank
        self.video_label = tk.Label(self.camera_frame)
        self.video_label.grid()

        self.update_video()

        root.mainloop()

    def update_video(self):
        # Get a frame from the camera
        frame = self.camera.get_frame()
        if frame is not None:
            frame = cv.cvtColor(frame, cv.COLOR_BGR2RGB)  # Convert to RGB
            img = Image.fromarray(frame)
            imgtk = ImageTk.PhotoImage(image=img)
            self.video_label.imgtk = imgtk  # Anchor the image to the label
            self.video_label.configure(image=imgtk)
        # Schedule the next update
        self.video_label.after(10, self.update_video)

    def add_palmprint(self):
        pass