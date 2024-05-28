import tensorflow as tf
import numpy as np
from typing import Literal
from model import dual_model, simple_model, prediction_layer
from data import get_data


def get_compatibility(data, person_indicies, hand_img, method: Literal['median', 'mean', 'max', 'min'] = 'median'):
    person_hands = tf.convert_to_tensor([data[i] for i in person_indicies])
    hand_img = tf.tile(hand_img, (person_hands.shape[0], 1))
    
    predictions = prediction_layer([person_hands, hand_img]).numpy()
    compatibility = None
    
    if method == 'median':
        compatibility = np.median(predictions)
    elif method == 'mean':
        compatibility = predictions.mean()
    elif method == 'max':
        compatibility = predictions.max()
    elif method == 'min':
        compatibility = predictions.min()
    else:
        raise ValueError(f'Invalid method {method} !')
    
    return compatibility


def get_best_idx_compatibility(data, persons_indices, hand_img, method: Literal['median', 'mean', 'max', 'min'] = 'median'):
    hand_img = tf.tile(hand_img, (data.shape[0], 1))
    
    predictions = prediction_layer([data, hand_img]).numpy()
    compatibilities = []
    
    for person_indices in persons_indices:
        person_predictions = [predictions[idx] for idx in person_indices]
        compatibility = None
        
        if method == 'median':
            compatibility = np.median(person_predictions)
        elif method == 'mean':
            compatibility = np.mean(person_predictions)
        elif method == 'max':
            compatibility = np.max(person_predictions)
        elif method == 'min':
            compatibility = np.min(person_predictions)
        elif method == 'all':
            compatibility = [np.median(person_predictions), np.mean(person_predictions), np.max(person_predictions), np.min(person_predictions)]
        else:
            raise ValueError(f'Invalid method {method} !')
        
        compatibilities.append(compatibility)
    
    best = np.argmax(compatibilities, axis=0)
    
    return best, compatibilities[best]


if __name__ == '__main__':
    model = dual_model((100, 100, 3), simple_model)
    model.load_weights('models/weights.04-0.69.weights.h5')
    
    data, train_indices, test_indices, val_indices = get_data(img_size=(100, 100), preprocessing='None')
    data = simple_model.predict(tf.convert_to_tensor(data))
    
    compatibility = get_compatibility(data, train_indices[0], data[0])
    
    print(compatibility)