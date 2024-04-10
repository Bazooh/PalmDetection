from GUI import GUI
from Camera import Camera

def main():
    camera = Camera()
    gui = GUI(camera)  # Pass the camera object to the GUI


if __name__ == "__main__":
    main()