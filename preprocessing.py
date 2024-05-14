import cv2
import numpy as np


def preprocess_image(image):
    # Convert to HSV color space for skin detection
    hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    
    # Define skin color range in HSV
    lower_skin = np.array([0, 20, 100], dtype=np.uint8)
    upper_skin = np.array([30, 255, 255], dtype=np.uint8)
    
    # Threshold the HSV image to get only skin colors
    mask = cv2.inRange(hsv_image, lower_skin, upper_skin)
    
    # Apply the mask to get the skin region
    skin_region = cv2.bitwise_and(image, image, mask=mask)
    
    # Find contours
    contours, _ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    
    # You might want to find the largest contour or use other criteria to select the palm contour
    if contours:
        # Assuming the largest contour corresponds to the hand
        hand_contour = max(contours, key=cv2.contourArea)
        # Create a new mask for the contour
        contour_mask = np.zeros_like(mask)
        cv2.drawContours(contour_mask, [hand_contour], -1, color=255, thickness=cv2.FILLED)
        
        # Apply this new mask to the original image
        final_result = cv2.bitwise_and(image, image, mask=contour_mask)
        
        # Convert to grayscale for CLAHE
        gray_image = cv2.cvtColor(final_result, cv2.COLOR_BGR2GRAY)

        # Apply CLAHE (Contrast Limited Adaptive Histogram Equalization)
        clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
        equalized_image = clahe.apply(gray_image)
        
        edges = cv2.Canny(equalized_image, 50, 80)
        
        return np.expand_dims(edges, axis=-1)


if __name__ == '__main__':
    image_path = 'Database/001/001_F_L_30.JPG'
    
    image = cv2.resize(cv2.imread(image_path), (100, 100))
    
    print(image.shape)
    processed_image = np.concatenate([image, preprocess_image(image)], axis=-1)
    print(processed_image.shape)
    
    print(processed_image[:, :, 0].mean(), processed_image[:, :, 1].mean(), processed_image[:, :, 2].mean(), processed_image[:, :, 3].mean())
    
    cv2.imshow('Processed Image', processed_image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()