import tensorflow as tf
from tensorflow.keras import layers, models, regularizers
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Resizing, Dropout


class PredictionLayer(tf.keras.Model):
    def __init__(self, loss_function):
        super(PredictionLayer, self).__init__()
        self.loss_function = loss_function
    
    def build(self, input_shape):
        self.alpha = self.add_weight(name='alpha', shape=(), initializer=tf.constant_initializer(1.0), trainable=True)

    def call(self, inputs):
        loss = self.loss_function(inputs[0], inputs[1])
        prediction = tf.math.exp(-self.alpha * loss)
        return prediction


prediction_layer = PredictionLayer(loss_function=tf.losses.mean_squared_error)

def dual_model(input_shape, network):
    # Create the left and right inputs for the pairs
    input_a = layers.Input(shape=input_shape)
    input_b = layers.Input(shape=input_shape)

    # Because we re-use the same instance `network`,
    # the weights of the network will be shared across the two branches
    processed_a = network(input_a)
    processed_b = network(input_b)
    
    # The prediction is the exponential of the negative error (L2 distance between the processed images)
    # Equals 1 if the distance is 0 (same image), 0 if the distance is infinite (different images)
    prediction = prediction_layer([processed_a, processed_b])

    # Connect the inputs with the outputs
    model = models.Model(inputs=[input_a, input_b], outputs=prediction)
    
    return model


lambda_regularizer = 0.0

simple_model = tf.keras.Sequential([
    Resizing(100, 100, interpolation='bilinear'),
    
    Conv2D(32, (3, 3), activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    MaxPooling2D((2, 2)),
    
    Conv2D(64, (3, 3), activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    MaxPooling2D((2, 2)),
    
    Conv2D(128, (3, 3), activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    MaxPooling2D((2, 2)),
    
    Conv2D(256, (3, 3), activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    MaxPooling2D((2, 2)),
    
    Conv2D(512, (3, 3), activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    MaxPooling2D((2, 2)),
    
    Flatten(),
    
    Dropout(0.2),
    Dense(128, activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
    Dropout(0.2),
    Dense(32, activation='relu', kernel_regularizer=regularizers.l2(lambda_regularizer)),
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
    Dense(64, activation='relu'),
    Dense(16, activation='relu'),
    # Dense(4, activation='relu'),
])