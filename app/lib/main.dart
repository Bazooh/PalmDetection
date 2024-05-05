import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:app/grpc_generated/client.dart';
import 'package:app/grpc_generated/init_py.dart';
import 'package:app/grpc_generated/service.pbgrpc.dart';
import 'package:image/image.dart' as img;

Future<void> pyInitResult = Future(() => null);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pyInitResult = initPy(true);
  final cameras = await availableCameras();

  // Check if there are any cameras available
  // if (cameras.isEmpty) return;

  runApp(MyApp(
    camera: cameras.first,
  ));
}

class MyApp extends StatelessWidget {
  final CameraDescription? camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      home: MyHomePage(
        title: 'Hand Recognition',
        camera: camera,
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  final CameraDescription? camera;

  const MyHomePage({super.key, required this.title, required this.camera});

  @override
  MyHomePageState createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late CameraController _controller;
  bool _isCameraReady = false;
  bool isImageValid = false;
  HashMap<String, (img.Image, ImageData)> registeredHands = HashMap();
  int pageIndex = 0;

  @override
  Future<AppExitResponse> didRequestAppExit() {
    shutdownPyIfAny();
    return super.didRequestAppExit();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  void _initCamera() async {
    if (widget.camera == null) {
      return;
    }

    _controller = CameraController(widget.camera!, ResolutionPreset.medium);

    // Initialize the camera
    await _controller.initialize();

    if (!mounted) {
      return;
    }

    setState(() {
      _isCameraReady = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<img.Image?> _takePicture() async {
    if (!_isCameraReady) return null;

    final XFile file = await _controller.takePicture();
    final img.Image? image = img.decodeImage(await file.readAsBytes());

    return image;
  }

  Future<ImageData> _getImageData(img.Image image) async {
    return ImageProcessingServiceClient(getClientChannel())
        .getImageData(BytesImage(bytes: image.data, height: image.height, width: image.width))
        .then((p0) => ImageData(data: p0.data));
  }

  Future<String?> _getImageOwner(ImageData imageData) async {
    List<String> owners = registeredHands.keys.toList();

    ImageOwner imageOwner = await ImageProcessingServiceClient(getClientChannel())
        .getImageOwner(ImageAndDataset(
          image: imageData,
          dataset: Dataset(
            owners: owners,
            images: owners.map((owner) => registeredHands[owner]!.$2)
          )
        ));
    
    if (!imageOwner.isInDatabase) return null;
    
    return imageOwner.owner;
  }

  void _addHand() async {
    final (String, img.Image)? newHand = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddHandPage(controller: _controller, takePicture: _takePicture)),
    );

    if (newHand == null) return;

    String owner = newHand.$1;
    img.Image imageBytes = newHand.$2;
    ImageData imageData = await _getImageData(imageBytes);

    setState(() {
      registeredHands[owner] = (imageBytes, imageData);
    });
  }

  void _removeHand(String owner) {
    setState(() {
      registeredHands.remove(owner);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        pageIndex == 0
        ? RegisteredHandsPage(
          registeredHands: registeredHands,
          handOwners: registeredHands.keys.toList()..sort(),
          removeHand: _removeHand,
        )
        : CameraBackground(controller: _controller),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Registered Hands',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Test Hand',
          ),
        ],
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pageIndex == 0) {
            _addHand();
          } else if (pageIndex == 1) {
            _takePicture().then((value) => {
              if (value != null) setState(() {
                // TODO: Implement image validation
              })
            });
          }
        },
        tooltip: pageIndex == 0 ? 'Add Hand' : 'Take Picture',
        child: Icon(pageIndex == 0 ? Icons.add : Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


class AddHandPage extends StatefulWidget {
  final CameraController? controller;
  final Future<img.Image?> Function() takePicture;

  const AddHandPage({super.key, required this.controller, required this.takePicture});

  @override
  AddHandPageState createState() => AddHandPageState();
}


class AddHandPageState extends State<AddHandPage> with WidgetsBindingObserver {

  Future<String?> _getOwner() async {
    String? owner;
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Owner'),
          content: TextField(autofocus: true, onChanged: (value) => owner = value),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (owner != null && owner!.isNotEmpty) {
                  Navigator.of(context).pop(owner);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<(String, img.Image)?> _buttonPressed() async {
    img.Image? dataBytes = await widget.takePicture();

    if (dataBytes == null) return null;

    String? owner = await _getOwner();

    if (owner == null) return null;

    return (owner, dataBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hand'),
      ),
      body: 
        widget.controller == null
        ? const Text('No camera available')
        : CameraBackground(controller: widget.controller!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _buttonPressed().then((value) {
            if (value != null) {
              Navigator.of(context).pop(value);
            }
          });
        },
        tooltip: 'Take Picture',
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}


class RegisteredHandsPage extends StatelessWidget {
  final HashMap<String, (img.Image, ImageData)> registeredHands;
  final List<String> handOwners;
  final void Function(String) removeHand;

  const RegisteredHandsPage({super.key, required this.registeredHands, required this.handOwners, required this.removeHand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Hands'),
      ),
      body: ListView.builder(
        itemCount: registeredHands.length,
        itemBuilder: (context, index) {
          String owner = handOwners[index];
          return ListTile(
            title: Text(owner),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeHand(owner),
            ),
          );
        },
      ),
    );
  }
}


class CameraBackground extends StatelessWidget {
  final CameraController controller;

  const CameraBackground({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CameraPreview(controller),
    );
  }
}