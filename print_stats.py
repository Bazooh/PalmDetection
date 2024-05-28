from sklearn.metrics import confusion_matrix, accuracy_score
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Plots the training and validation accuracies across the epochs
def plot_training_and_validation_accuracies(history):
    # Plot training & validation accuracy values
    plt.figure(figsize=(12, 5))

    plt.subplot(1, 2, 1)
    plt.plot(history.history['binary_accuracy'])
    plt.plot(history.history['val_binary_accuracy'])
    plt.title('Model Accuracy')
    plt.ylabel('Accuracy')
    plt.xlabel('Epoch')
    plt.legend(['Train', 'Validation'], loc='right')

    # Plot training & validation loss values
    plt.subplot(1, 2, 2)
    plt.plot(history.history['loss'])
    plt.plot(history.history['val_loss'])
    plt.title('Model Loss')
    plt.ylabel('Loss')
    plt.xlabel('Epoch')
    plt.legend(['Train', 'Validation'], loc='right')

    plt.show()

# Print accuracies, then the confusion matrix
def print_all_accuracies_and_plot_matrices(model, train_pairs, train_labels, test_pairs, test_labels, val_pairs, val_labels):
    def get_predictions_and_accuracy(pairs, labels):
        predictions = model.predict([pairs[:, 0], pairs[:, 1]])
        accuracy = accuracy_score(labels, predictions > 0.5)
        return predictions, accuracy
    
    # Function to plot confusion matrix
    def plot_confusion_matrix(pairs, labels, title="Confusion Matrix"):
        predictions = model.predict([pairs[:, 0], pairs[:, 1]])
        predicted_classes = (predictions > 0.5).astype(int)

        cm = confusion_matrix(labels, predicted_classes)

        plt.figure(figsize=(10, 7))
        sns.heatmap(cm, annot=True, fmt='g', cmap='Blues', xticklabels=np.unique(labels), yticklabels=np.unique(labels))
        plt.xlabel('Predicted')
        plt.ylabel('True')
        plt.title(title)
        plt.show()

    # Get accuracies
    _, train_accuracy = get_predictions_and_accuracy(train_pairs, train_labels)
    # _, test_accuracy = get_predictions_and_accuracy(test_pairs, test_labels)
    _, val_accuracy = get_predictions_and_accuracy(val_pairs, val_labels)

    # Print accuracies
    print(f"Train accuracy: {train_accuracy}")
    # print(f"Test accuracy: {test_accuracy}")
    print(f"Val accuracy: {val_accuracy}")



    # Plot confusion matrices
    plot_confusion_matrix(train_pairs, train_labels, title="Train Confusion Matrix")
    # plot_confusion_matrix(test_pairs, test_labels, title="Test Confusion Matrix")
    plot_confusion_matrix(val_pairs, val_labels, title="Validation Confusion Matrix")