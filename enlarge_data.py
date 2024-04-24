from tensorflow.keras.preprocessing.image import ImageDataGenerator
import cv2
from data import get_data
from tqdm import tqdm


transform_images = ImageDataGenerator(
    rotation_range=30,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    # brightness_range=(0.8, 1.2),
    fill_mode='nearest'
)


def get_enlarge_data(img_size=(100, 100), extended_factor: int = 10):
    '''
    Returns a list of images and indices for training and testing with training data size multiplied by `extended_factor`
        - data: np.array of shape (n, img_size[0], img_size[1], 3) => [img1, img2, ...]
        - train_indices: 2d array where each row contains indices of images for the same palmprint => [[0, 3, 1], [5, 4, 7], ...]
        - test_indices: 2d array where each row contains indices of images for the same palmprint => [[2], [6], ...]
    '''
    data, train_indices, test_indices = get_data(img_size)
    
    
    for classes_idx in tqdm(range(len(train_indices))):
        for idx in train_indices[classes_idx]:
            image = data[idx]
            for i in range(extended_factor):
                transformed_image = transform_images.random_transform(image)
                data.append(transformed_image)
        
        train_indices[classes_idx] += list(range(len(data) - extended_factor*len(train_indices[classes_idx]), len(data)))

    return data, train_indices, test_indices