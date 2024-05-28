from model import dual_model
from tensorflow.keras import optimizers
from tensorflow.keras.callbacks import ModelCheckpoint
import os

def train(input_shape, weight_directory, network, pairs, labels, validation_data=None, epochs=10):
    model = dual_model(input_shape, network)

    model.compile(loss='binary_crossentropy', optimizer=optimizers.Adam(), metrics=['binary_accuracy'])
    
    # Use a relative or absolute path within a writable directory
    weight_path = os.path.join(os.getcwd(), "Weights", weight_directory)
    
    # Check if the directory exists, if not, create it
    if not os.path.exists(weight_path):
        os.makedirs(weight_path)

    checkpoint = ModelCheckpoint(
        os.path.join(weight_path, "weights.{epoch:02d}-{val_loss:.2f}.weights.h5"), 
        monitor='val_loss', 
        save_best_only=True, 
        verbose=1, 
        save_freq='epoch',
        save_weights_only=True
    )

    history = model.fit([pairs[:, 0], pairs[:, 1]], labels, batch_size=128, epochs=epochs, validation_data=validation_data, callbacks=[checkpoint])

    return history, model