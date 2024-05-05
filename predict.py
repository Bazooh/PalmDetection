from model import dual_model, simple_model
import numpy as np
import json
import sys


model = dual_model((100, 100, 3), simple_model)
model.load_weights('model.h5')


def process_image(image_bytes):
    image_np = np.frombuffer(image_bytes, dtype=np.uint8)
    sum_pixel_values = np.sum(image_np)

    return sum_pixel_values


def main():
    # Read input from Flutter
    while True:
        input_data = sys.stdin.readline().strip()
        if not input_data:
            break

        # Parse input data
        input_json = json.loads(input_data)
        method = input_json['method']
        args = input_json.get('args', {})

        if method == 'processImage':
            image_bytes = args.get('imageBytes', None)

            # Process the image
            if image_bytes:
                result = process_image(image_bytes)

                # Send result back to Flutter
                sys.stdout.write(json.dumps({'result': result}) + '\n')
                sys.stdout.flush()


if __name__ == '__main__':
    main()