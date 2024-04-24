import os
import glob
import random
import cv2
import numpy as np
from tqdm import tqdm


random.seed(42)


def get_data(img_size=(100, 100)):
    '''
    Returns a list of images and indices for training and testing
        - data: np.array of shape (n, img_size[0], img_size[1], 3) => [img1, img2, ...]
        - train_indices: 2d array where each row contains indices of images for the same palmprint => [[0, 3, 1], [5, 4, 7], ...]
        - test_indices: 2d array where each row contains indices of images for the same palmprint => [[2], [6], ...]
    '''
    data = []
    train_indices = []
    test_indices = []
    database_path = 'Database'
    
    for folder in tqdm(os.listdir(database_path)):
        folder_path = os.path.join(database_path, folder)
        
        if not os.path.isdir(folder_path):
            continue

        image_files = glob.glob(os.path.join(folder_path, '*.JPG'))
        images = [cv2.resize(cv2.imread(image_file), img_size) for image_file in image_files]
        
        idxs = [i + len(data) for i in range(len(image_files))]
        train_idxs = random.sample(idxs, int(len(image_files) * 0.8))
        test_idxs = list(set(idxs) - set(train_idxs))

        train_indices.append(train_idxs)
        test_indices.append(test_idxs)
        
        data.extend(images)
    
    return data, train_indices, test_indices


# Create pairs for training
def create_pairs(x, digit_indices):
    '''
    Positive and negative pair creation.
    Alternates between positive and negative pairs.
    
    Returns:
        - pairs: np.array of shape (2 * frac * len(x), 2, img_size[0], img_size[1], 3) => [[img1, img2], [img3, img4], ...]
        - labels: np.array of shape (2 * frac * len(x),) => [1, 0, 1, 0, ...]
    
    frac = 0.8 if train else 0.2
    '''
    pairs = []
    labels = []
    n = min([len(indices) for indices in digit_indices]) - 1
    for d in range(len(digit_indices)):
        for i in range(n):
            z1, z2 = digit_indices[d][i], digit_indices[d][i + 1]
            pairs += [[x[z1], x[z2]]]
            
            random_d = (d + random.randrange(1, len(digit_indices))) % len(digit_indices)
            random_i = random.randrange(0, len(digit_indices[random_d]))
            
            z1, z2 = digit_indices[d][i], digit_indices[random_d][random_i]
            pairs += [[x[z1], x[z2]]]
            
            labels += [1, 0]
    
    return np.array(pairs), np.array(labels)


