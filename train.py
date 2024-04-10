import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models, optimizers
from model import simple_model, input_shape


# Create pairs for training
def create_pairs(x, digit_indices):
    '''Positive and negative pair creation.
    Alternates between positive and negative pairs.'''
    pairs = []
    labels = []
    n = min([len(digit_indices[d]) for d in range(10)]) - 1
    for d in range(10):
        for i in range(n):
            z1, z2 = digit_indices[d][i], digit_indices[d][i + 1]
            pairs += [[x[z1], x[z2]]]
            inc = random.randrange(1, 10)
            dn = (d + inc) % 10
            z1, z2 = digit_indices[d][i], digit_indices[dn][i]
            pairs += [[x[z1], x[z2]]]
            labels += [1, 0]
    return np.array(pairs), np.array(labels)


def train(input_shape, network):
    # Create the left and right inputs for the pairs
    input_a = layers.Input(shape=input_shape)
    input_b = layers.Input(shape=input_shape)

    # Because we re-use the same instance `base_network`,
    # the weights of the network will be shared across the two branches
    processed_a = network(input_a)
    processed_b = network(input_b)

    # Example distance layer (L1 distance)
    distance = layers.Lambda(lambda embeddings: tf.abs(embeddings[0] - embeddings[1]))([processed_a, processed_b])

    # Add a dense layer with a sigmoid unit to generate the similarity score
    prediction = layers.Dense(1, activation='sigmoid')(distance)

    # Connect the inputs with the outputs
    model = models.Model(inputs=[input_a, input_b], outputs=prediction)

    # Compile the model
    model.compile(loss='binary_crossentropy', optimizer=optimizers.Adam(), metrics=['accuracy'])

    # Assume `pairs` and `labels` are prepared datasets
    # pairs = [[imgA1, imgB1], [imgA2, imgB2], ...]
    # labels = [1, 0, ...] where 1 is same class, 0 is different class
    # train_model(model, pairs, labels) # Example function to train the model
    
    return model


def main():
    model = train(input_shape, simple_model)
    print(model.summary())


if __name__ == "__main__":
    main()