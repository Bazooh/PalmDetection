from model import dual_model
from tensorflow.keras import optimizers


def train(input_shape, network, pairs, labels, epochs=10):
    model = dual_model(input_shape, network)

    # Compile the model
    model.compile(loss='binary_crossentropy', optimizer=optimizers.Adam(), metrics=['accuracy'])
    
    model.fit([pairs[:, 0], pairs[:, 1]], labels, batch_size=128, epochs=epochs)
    
    return model