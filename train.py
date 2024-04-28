import tensorflow as tf
from tensorflow.keras import layers, models, optimizers


def train(input_shape, network, pairs, labels, epochs=10):
    # Create the left and right inputs for the pairs
    input_a = layers.Input(shape=input_shape)
    input_b = layers.Input(shape=input_shape)

    # Because we re-use the same instance `base_network`,
    # the weights of the network will be shared across the two branches
    processed_a = network(input_a)
    processed_b = network(input_b)

    # Example distance layer (L2 distance)
    distance = layers.Lambda(lambda embeddings: tf.square(embeddings[0] - embeddings[1]))([processed_a, processed_b])

    # Add a dense layer with a sigmoid unit to generate the similarity score
    prediction = layers.Dense(1, activation='sigmoid')(distance)

    # Connect the inputs with the outputs
    model = models.Model(inputs=[input_a, input_b], outputs=prediction)

    # Compile the model
    model.compile(loss='binary_crossentropy', optimizer=optimizers.Adam(), metrics=['accuracy'])
    
    model.fit([pairs[:, 0], pairs[:, 1]], labels, batch_size=128, epochs=epochs)
    
    return model