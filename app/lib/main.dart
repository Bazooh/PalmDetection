import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:app/grpc_generated/init_py.dart';
import 'package:app/grpc_generated/service.pbgrpc.dart';
import 'package:grpc/service_api.dart';
import 'package:image/image.dart' as img;
import './connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(AppWithConnection(
    camera: cameras.first,
  ));
}


final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    // primarySwatch: const Colors(0xFFFFFDD0),
    accentColor: const Color.fromARGB(255, 141, 141, 141), // Muted teal
    backgroundColor: const Color(0xFFF5F5F5), // Light grey
    cardColor: const Color(0xFFFFFFFF), // White for card backgrounds
  ).copyWith(
    secondary: const Color.fromARGB(255, 60, 60, 60), // Secondary color for accent
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 223, 223, 223),
  
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 31, 31, 31),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    headline2: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
    headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: Color(0xFF333333)),
    headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: Color(0xFF333333)),
    headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Color(0xFF333333)),
    headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Color(0xFF333333)),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Color(0xFF666666)),
    bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xFF666666)),
    button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xFF888888)), // Additional text style
    subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xFF444444)), // Additional text style
    subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xFF666666)), // Additional text style
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF132137),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 232, 232, 232),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 19, 15, 57)),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 131, 131, 131)),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    labelStyle: TextStyle(color: Color.fromARGB(255, 92, 92, 92)), // Label style for inputs
    hintStyle: TextStyle(color: Color(0xFFBBBBBB)), // Hint style for inputs
  ),

  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 12, 255, 69),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 226, 226, 226),
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 45, 45, 45),
    foregroundColor: Color.fromARGB(255, 226, 226, 226),
  ),
  
  dialogBackgroundColor: const Color.fromARGB(255, 231, 231, 231),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromARGB(255, 255, 255, 255),
    unselectedItemColor: Color.fromARGB(255, 131, 131, 131),
    backgroundColor: Color.fromARGB(255, 33, 33, 33),
    elevation: 8,
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 45, 45, 45),
    ),
  ),
);


final Widget background = Stack(children: [
  Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color.fromARGB(255, 231, 231, 231), Color.fromARGB(255, 147, 147, 147)], // Change colors as per your preference
      ),
    ),
  ),
  Positioned.fill(
    child: Opacity(
      opacity: 0.2, // Adjust the opacity as needed
      child: Image.asset(
        'assets/palmprint.png', // Assuming palmprint.png is in the assets folder
        fit: BoxFit.cover,
      ),
    ),
  ),
]);

class AppWithConnection extends StatelessWidget {
  final CameraDescription? camera;

  const AppWithConnection({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palm Detection',
      theme: themeData,
      home: ConnectionPage(
        onConnected: (context, clientChannel) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyApp(camera: camera, clientChannel: clientChannel),
          ));
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final CameraDescription? camera;
  final ClientChannel clientChannel;

  const MyApp({super.key, required this.camera, required this.clientChannel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: MyHomePage(
        title: 'Hand Recognition',
        camera: camera,
        clientChannel: clientChannel,
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  final CameraDescription? camera;
  final ClientChannel clientChannel;

  const MyHomePage({super.key, required this.title, required this.camera, required this.clientChannel});

  @override
  MyHomePageState createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late CameraController _controller;
  bool _isCameraReady = false;
  HashMap<String, img.Image> registeredHands = HashMap();
  List<String> handOwners = [];
  int pageIndex = 0;
  String? selelectedOwner;

  @override
  Future<AppExitResponse> didRequestAppExit() {
    shutdownPyIfAny();
    return super.didRequestAppExit();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _getHandOwners().then((value) => setState(() {
      handOwners = value;
      print(handOwners);
    }));
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

    if (image == null) return null;

    return img.copyRotate(image, 90);
  }

  Future<ImageOwner> _getImageOwner(BytesImage image) async {
    return await ImageProcessingServiceClient(widget.clientChannel)
        .getImageOwner(image);
  }

  Future<Confidence> _isImageOwnedByOwner(BytesImage image, String owner) async {
    return await ImageProcessingServiceClient(widget.clientChannel)
        .isImageOwnedByOwner(ImageAndOwner(
          image: image,
          owner: owner,
        ));
  }

  Future<void> _addImageToDataset(BytesImage image, String owner) async {
    await ImageProcessingServiceClient(widget.clientChannel)
        .addImageToDatabase(ImageAndOwner(
          image: image,
          owner: owner,
        ));
  }

  Future<List<String>> _getHandOwners() async {
    return await ImageProcessingServiceClient(widget.clientChannel)
        .getHandOwners(Empty()).then((handOwners) => handOwners.names);
  }

  Future<void> _addHand() async {
    final (String, img.Image)? newHand = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddHandPage(controller: _controller, takePicture: _takePicture)),
    );

    if (newHand == null) return;

    String owner = newHand.$1;
    img.Image imageBytes = newHand.$2;

    await _addImageToDataset(_toBytesImage(imageBytes), owner);
    handOwners = await _getHandOwners();

    setState(() {
      registeredHands[owner] = imageBytes;
    });
  }

  void _removeHand(String owner) {
    setState(() {
      registeredHands.remove(owner);
    });
  }

  BytesImage _toBytesImage(img.Image image) {
    return BytesImage(bytes: image.data, width: image.width, height: image.height);
  }

  Future<ImageOwner> processImageGetOwner(img.Image image) async {
    ImageOwner imageOwner = await _getImageOwner(_toBytesImage(image));

    return imageOwner;
  }

  Future<ImageOwner> processImageTestOwner(img.Image image, String owner) async {
    if (owner.isEmpty) {
      return ImageOwner(
        owner: '',
        confidence: Confidence(result: false, probability: 0),
      );
    }

    Confidence confidence = await _isImageOwnedByOwner(_toBytesImage(image), owner);
    
    return ImageOwner(
      owner: owner,
      confidence: confidence,
    );
  }

  Future<void> processImage(img.Image? image) async {
    if (image == null) return;

    void Function(void Function()) setDialogState = (_) {};
    Text dialogTitle = const Text(
      "Processing Image...",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
      ),
    );
    Widget dialogDescription = const LinearProgressIndicator();

    showDialog(
      context: context,
      builder: (context) {

        return StatefulBuilder(
          builder: (context, setState) {
            setDialogState = setState;

            return AlertDialog(
              title: dialogTitle,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.memory(Uint8List.fromList(img.encodePng(image))),
                  const SizedBox(height: 20),
                  dialogDescription,
                  const SizedBox(height: 5),
                ],
              )
            );
          }
        );
      },
    );

    ImageOwner imageOwner;
    if (pageIndex == 1) {
      imageOwner = await processImageGetOwner(image);
    }
    else if (pageIndex == 2) {
      if (handOwners.isEmpty || selelectedOwner == null) {
        return;
      }

      imageOwner = await processImageTestOwner(image, selelectedOwner!);
    }
    else {
      return;
    }

    setDialogState(() {
      dialogTitle = Text(
        imageOwner.confidence.result ? imageOwner.owner : pageIndex == 1 ? 'Unknown' : 'Not $selelectedOwner',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: imageOwner.confidence.result ? null : Colors.red,
        ),
      );
      dialogDescription = Text(
        'Probability: ${
          imageOwner.confidence.result
            ? (100 * imageOwner.confidence.probability).toStringAsFixed(1)
            : (100 * (1 - imageOwner.confidence.probability)).toStringAsFixed(1)
        } %',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: imageOwner.confidence.result ? null : Colors.red,
        ),
      );
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
        : pageIndex == 1
        ? CameraBackground(controller: _controller)
        : Stack(
          children: [
            CameraBackground(controller: _controller),
            DropdownButton<String>(
              value: selelectedOwner,
              items: handOwners.map((owner) {
                return DropdownMenuItem<String>(
                  value: owner,
                  alignment: Alignment.center,
                  child: Text(owner),
                );
              }).toList()..sort((a, b) => (a.value ?? '').compareTo(b.value ?? '')),
              onChanged: (value) {
                setState(() {
                  selelectedOwner = value;
                });
              },
              isExpanded: true,
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Registered Hands',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Get Owner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Test Owner',
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
          } else {
            _takePicture().then(processImage);
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
    String owner = '';
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
                if (owner.isNotEmpty) {
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
  final HashMap<String, img.Image> registeredHands;
  final List<String> handOwners;
  final void Function(String) removeHand;

  const RegisteredHandsPage({super.key, required this.registeredHands, required this.handOwners, required this.removeHand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Hands'),
      ),
      body: Stack(
        children: [
          background,
          ListView.builder(
            itemCount: registeredHands.length,
            itemBuilder: (context, index) {
              String owner = handOwners[index];
              return ListTile(
                title: Text(owner),
                onTap: () {
                  img.Image image = registeredHands[owner]!;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(owner),
                        content: Image.memory(Uint8List.fromList(img.encodePng(image))),
                      );
                    },
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => removeHand(owner),
                ),
              );
            },
          ),
        ],
      )
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