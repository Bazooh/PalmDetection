import os
import glob
import random
import cv2
import numpy as np
from tqdm import tqdm
from preprocessing import preprocess_image
from typing import Literal


random.seed(42)


def get_data(img_size=(100, 100), preprocessing: Literal[None, 'only', 'both'] = None):
    '''
    Returns a list of images and indices for training and testing
        - data: np.array of shape (n, img_size[0], img_size[1], 3) => [img1, img2, ...]
        - train_indices: 2d array where each row contains indices of images for the same palmprint => [[0, 3, 1], [5, 4, 7], ...]
        - test_indices: 2d array where each row contains indices of images for the same palmprint => [[2], [6], ...]
    '''
    data = []
    train_indices = []
    test_indices = []
    val_indices = []
    database_path = 'DatabaseNoBackground'
    
    persons = os.listdir(database_path)
    
    for folder in tqdm(os.listdir(database_path)):
        folder_path = os.path.join(database_path, folder)
        
        if not os.path.isdir(folder_path):
            continue

        image_files = glob.glob(os.path.join(folder_path, '*.JPG')) + \
                      glob.glob(os.path.join(folder_path, '*.jpeg'))
        
        if len(image_files) == 0:
            continue
        
        images = [cv2.resize(cv2.imread(image_file), img_size) for image_file in image_files]
        idxs = [i + len(data) for i in range(len(image_files))]
        
        train_indices.append(random.sample(idxs, int(len(image_files) * 0.8)))
        val_indices.append(list(set(idxs) - set(train_indices[-1])))
        
        if (preprocessing == 'only'):
            images = [preprocess_image(image) for image in images]
        
        if (preprocessing == 'both'):
            images = [np.concatenate([image, preprocess_image(image)], axis=-1) for image in images]
        
        data.extend(images)
    
    return data, train_indices, test_indices, val_indices


# Create pairs for training
def create_pairs(x, digit_indices, n_true_pairs=1, n_false_pairs=1):
    '''
    Positive and negative pair creation.
    Alternates between positive and negative pairs.
    
    Returns:
        - pairs: np.array of shape (None, 2, img_size[0], img_size[1], 3) => [[img1, img2], [img3, img4], ...]
        - labels: np.array of shape (None,) => [1, 0, 1, 0, ...]
    '''
    
    if len(digit_indices) == 0:
        return np.array([]), np.array([])
    
    pairs = []
    labels = []
    for d in range(len(digit_indices)):
        for i in range(len(digit_indices[d])):
            for _ in range(n_true_pairs):
                random_i = (i + random.randrange(1, len(digit_indices[d]))) % len(digit_indices[d])
                z1, z2 = digit_indices[d][i], digit_indices[d][random_i]
                pairs += [[x[z1], x[z2]]]

                labels.append(1)
            
            for _ in range(n_false_pairs):
                random_d = (d + random.randrange(1, len(digit_indices))) % len(digit_indices)
                
                random_i = random.randrange(0, len(digit_indices[random_d]))
                
                z1, z2 = digit_indices[d][i], digit_indices[random_d][random_i]
                pairs += [[x[z1], x[z2]]]

                labels.append(0)
    
    return np.array(pairs), np.array(labels)


