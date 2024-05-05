import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Resizing


def dual_model(input_shape, network):
    # Create the left and right inputs for the pairs
    input_a = layers.Input(shape=input_shape)
    input_b = layers.Input(shape=input_shape)

    # Because we re-use the same instance `network`,
    # the weights of the network will be shared across the two branches
    processed_a = network(input_a)
    processed_b = network(input_b)

    # Example distance layer (L2 distance)
    distance = layers.Lambda(lambda embeddings: tf.square(embeddings[0] - embeddings[1]))([processed_a, processed_b])

    # Add a dense layer with a sigmoid unit to generate the similarity score
    prediction = layers.Dense(1, activation='sigmoid')(distance)

    # Connect the inputs with the outputs
    model = models.Model(inputs=[input_a, input_b], outputs=prediction)
    
    return model


simple_model = tf.keras.Sequential([
    Resizing(100, 100, interpolation='bilinear'),
    
    Conv2D(32, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(256, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(512, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Flatten(),
    Dense(512, activation='relu'),
    Dense(512, activation='relu'),
])


alexnet_model = tf.keras.Sequential([
    Resizing(100, 100, interpolation='bilinear'),
    
    Conv2D(96, (11, 11), strides=(4, 4), activation='relu'),
    MaxPooling2D((3, 3), strides=(2, 2)),
    
    Conv2D(256, (5, 5), padding='same', activation='relu'),
    MaxPooling2D((3, 3), strides=(2, 2)),
    
    Conv2D(384, (3, 3), padding='same', activation='relu'),
    Conv2D(384, (3, 3), padding='same', activation='relu'),
    Conv2D(256, (3, 3), padding='same', activation='relu'),
    MaxPooling2D((3, 3), strides=(2, 2)),
    
    Flatten(),
    Dense(4096, activation='relu'),
    Dense(4096, activation='relu'),
    Dense(512, activation='relu'),
])


small_cnn_model = tf.keras.Sequential([
    Resizing(100, 100, interpolation='bilinear'),
    
    Conv2D(16, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(32, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    
    Flatten(),
    Dense(128, activation='relu'),
    Dense(512, activation='relu'),
    # Dense(4, activation='relu'),
])