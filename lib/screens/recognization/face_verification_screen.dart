import 'dart:io';

import 'package:camera/camera.dart';
import 'package:employee/controllers/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import '../../controllers/face_recognization/face_values_controller.dart';
import '../../service/face_recognization/ML/Recognition.dart';
import '../../service/face_recognization/ML/Recognizer.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';

class FaceVerificationScreen extends StatefulWidget {
  // const FaceRecognizationTesting({super.key,required this.cameras,required this.employee});

  FaceVerificationScreen({
    super.key,
    required this.type,
    required this.cameras,
    required this.searchUserId,
    required this.faceValuesController,
    required this.homeController,
  });

  String type;
  final List<CameraDescription> cameras;
  final String searchUserId;
  FaceValuesController faceValuesController;
  HomeController homeController;

  // final Emp employee;

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreen();
}

class _FaceVerificationScreen extends State<FaceVerificationScreen> {
  List<List<double>> oldFaceValue = [];
  Pair? pair;

  bool isLoading = false;
  CameraImage? imagePreview;
  String finalPath = "";
  XFile? finalImage;

  dynamic controller;
  bool isBusy = false;
  late Size size;
  late CameraDescription description = widget.cameras[1];
  CameraLensDirection camDirec = CameraLensDirection.front;
  late List<Recognition> recognitions = [];
  TextEditingController textEditingController = TextEditingController();
  late FaceDetector faceDetector;
  late Recognizer recognizer;
  img.Image? image;
  bool register = false;
  dynamic _scanResults;
  CameraImage? frame;

  @override
  initState() {
    // oldFaceValue = widget.faceValuesController.map.value.values.toList();
    oldFaceValue = widget.faceValuesController.faceValues;

    var options = FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);
    faceDetector = FaceDetector(options: options);
    recognizer = Recognizer();
    initializeCamera();

    imagePreview = null;
    finalPath = "";
    finalImage = null;
    super.initState();
  }

  doSomething() {
    setState(() {
      isBusy = false;
    });
  }

  initializeCamera() async {
    controller = CameraController(description, ResolutionPreset.ultraHigh);
    await controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image) => {
            if (!isBusy) {isBusy = true, frame = image, doSomething()}
          });
    });
  }

  doFaceRegistrationOnFrame() async {
    setState(() {
      isLoading = true;
    });

    InputImage inputImage = getInputImage();
    List<Face> faces = await faceDetector.processImage(inputImage);

    if (faces.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Face Found")));

      setState(() {
        isLoading = false;
      });
    } else {
      performRegistration(faces);
      setState(() {
        _scanResults = faces;
      });
    }
    setState(() {
      isBusy = false;
    });
  }

  Future<List<Face>> detectFacesFromMemory(XFile imageFile) async {
    setState(() {
      isLoading = true;
    });
    final Uint8List imageBytes = await imageFile.readAsBytes();

    final inputImage = InputImage.fromFilePath(imageFile.path);

    final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        enableLandmarks: true,
        enableContours: true,
        enableClassification: true,
      ),
    );

    final List<Face> faces = await faceDetector.processImage(inputImage);
    await faceDetector.close(); // Free resources

    print("Found Faces: ${faces.length}");

    if (faces.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Face Found")));

      setState(() {
        isLoading = false;
      });
    } else {
      performRegistration(faces);
      setState(() {
        _scanResults = faces;
      });
    }
    setState(() {
      isBusy = false;
    });
    return faces;
  }

  img.Image convertYUV420ToImage(CameraImage cameraImage) {
    final width = cameraImage.width;
    final height = cameraImage.height;

    final yRowStride = cameraImage.planes[0].bytesPerRow;
    final uvRowStride = cameraImage.planes[1].bytesPerRow;
    final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    final image = img.Image(width: width, height: height);

    for (var w = 0; w < width; w++) {
      for (var h = 0; h < height; h++) {
        final uvIndex = uvPixelStride * (w / 2).floor() + uvRowStride * (h / 2).floor();
        final index = h * width + w;
        final yIndex = h * yRowStride + w;

        final y = cameraImage.planes[0].bytes[yIndex];
        final u = cameraImage.planes[1].bytes[uvIndex];
        final v = cameraImage.planes[2].bytes[uvIndex];

        image.data!.setPixelR(w, h, yuv2rgb(y, u, v)); //= yuv2rgb(y, u, v);
      }
    }
    return image;
  }

  int yuv2rgb(int y, int u, int v) {
    // Convert yuv pixel to rgb
    var r = (y + v * 1436 / 1024 - 179).round();
    var g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91).round();
    var b = (y + u * 1814 / 1024 - 227).round();

    // Clipping RGB values to be inside boundaries [ 0 , 255 ]
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);

    return 0xff000000 | ((b << 16) & 0xff0000) | ((g << 8) & 0xff00) | (r & 0xff);
  }

  InputImage getInputImage() {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in frame!.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(frame!.width.toDouble(), frame!.height.toDouble());
    final camera = description;
    final imageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);

    final inputImageFormat = InputImageFormatValue.fromRawValue(frame!.format.raw);

    // final planeData = frame!.planes.map(
    //   (Plane plane) {
    //     return ImageMetadata(
    //       bytesPerRow: plane.bytesPerRow,
    //       height: plane.height,
    //       width: plane.width,
    //     );
    //   },
    // ).toList();

    final inputImageData = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation!,
      format: inputImageFormat!, bytesPerRow: frame!.planes.first.bytesPerRow,

    );

    final inputImage = InputImage.fromBytes(bytes: bytes, metadata: inputImageData);

    return inputImage;
  }

  cropAndGetPathColorImage(List<Face> faces) async {
    ConvertImage covert = ConvertImage();
    try {
      img.Image imageTemp = await covert.convertYUV420ToImage(frame!);

      imageTemp = img.copyRotate(imageTemp!, angle: camDirec == CameraLensDirection.front ? 270 : 90);

      for (Face face in faces) {
        Rect faceRect = face.boundingBox;
        img.Image croppedFaceTemp = img.copyCrop(imageTemp!, x: faceRect.left.toInt(), y: faceRect.top.toInt(), width: faceRect.width.toInt(), height: faceRect.height.toInt() + 70);

        finalPath = await covert.convertCameraImageToFilePathWithCropt(croppedFaceTemp, 0);
      }

    } catch (e) {
      if (kDebugMode) {
        print("Testing $e");
      }
    }
    setState(() {
      finalPath;
    });
  }

  performRegistration(List<Face> faces) async {
    recognitions.clear();
    image = convertYUV420ToImage(frame!);
    image = img.copyRotate(image!, angle: camDirec == CameraLensDirection.front ? 270 : 90);

    await cropAndGetPathColorImage(faces);

    for (Face face in faces) {
      Rect faceRect = face.boundingBox;
      img.Image croppedFace = img.copyCrop(image!, x: faceRect.left.toInt(), y: faceRect.top.toInt(), width: faceRect.width.toInt(), height: faceRect.height.toInt());

      List<double> emeddingFace = recognizer.getEmbeddingRecognize(croppedFace, faceRect);

      setState(() {
        pair = Recognizer().findNearest(emeddingFace, oldFaceValue);
      });

      if (pair != null) {
        if (pair!.value && finalPath != "") {
          Get.snackbar("", "Face Verified...", backgroundColor: Colors.black, colorText: Colors.white);
          showFaceRegistrationDialogue(true, croppedFace, emeddingFace);
        } else {
          Get.snackbar("", "Face Not Recognized", backgroundColor: Colors.black, colorText: Colors.white);
          showFaceRegistrationDialogue(false, croppedFace, emeddingFace);
        }
      } else {
        showFaceRegistrationDialogue(false, croppedFace, emeddingFace);
      }

      setState(() {
        isLoading = false;
        widget.homeController.ischeckLoading.value = false;
      });
    }
  }

  showFaceRegistrationDialogue(bool faceVerified, img.Image croppedFace, List<double> recognition) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.lightBlue.shade50,
        title: const Text(
          "Face Registration",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1.2),
        ),
        alignment: Alignment.center,
        content: SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    // Adjust the radius as needed
                    child: Image.file(
                      File(finalPath),
                      fit: BoxFit.cover, // Optional: Adjust the fit as needed
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              (pair == null)
                  ? const Text("Couldn't Verify Face...", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 1.5))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Visibility(
                          visible: false,
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: Center(child: Text("Distance : ${pair!.distance.toString().substring(0, 8)}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 0))),
                        ),
                        Center(child: Text(faceVerified ? "Face Recognized" : "Face Not Recognized", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 1.5))),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: faceVerified,
                child: ElevatedButton(
                    onPressed: () async {
                      await widget.homeController.clockInAfterVerification(context, widget.type, finalPath);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, minimumSize: const Size(200, 40)),
                    child: Text(
                      widget.type == "1" ? "Check In" : "Check Out",
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: false,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => Finalresultscreen(
                      //           searchUserId: widget.searchUserId,
                      //           CurrentfaceEmbedding: recognition,
                      //         )));
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Face Registered"),));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, minimumSize: const Size(200, 40)),
                    child: const Text(
                      "Verify Employee",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, minimumSize: const Size(200, 40)),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget buildResult() {
    if (!controller.value.isInitialized && _scanResults == null) {
      return const Center(child: Text('Camera is not initialized'));
    }
    final Size imageSize = Size(
      controller.value.previewSize!.height,
      controller.value.previewSize!.width,
    );
    if (_scanResults != null) {
      return Container();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = [];
    size = MediaQuery.of(context).size;
    if (controller != null) {
      stackChildren.add(
        Positioned(
          top: 0.0,
          left: 0.0,
          width: size.width,
          height: size.height,
          child: Container(
            child: (controller.value.isInitialized)
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller),
                  )
                : Container(),
          ),
        ),
      );

    }

    stackChildren.add(Positioned(
      top: size.height * 0.90,
      left: 0,
      width: size.width,
      height: 60,
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        color: MyColors.darkBlueColor,
        // color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () async{
                      XFile image = await controller.takePicture();
                      detectFacesFromMemory(image);
                      // setState(() {
                      //
                      //   doFaceRegistrationOnFrame();
                      // });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
            children: stackChildren,
          ),
    );
  }
}

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.absoluteImageSize, this.faces, this.camDire2);

  final Size absoluteImageSize;
  final List<Recognition> faces;
  CameraLensDirection camDire2;

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.indigoAccent;

    for (Recognition face in faces) {
      canvas.drawRect(
        Rect.fromLTRB(
          camDire2 == CameraLensDirection.front ? (absoluteImageSize.width - face.location.right) * scaleX : face.location.left * scaleX,
          face.location.top * scaleY,
          camDire2 == CameraLensDirection.front ? (absoluteImageSize.width - face.location.left) * scaleX : face.location.right * scaleX,
          face.location.bottom * scaleY,
        ),
        paint,
      );

      TextSpan span = TextSpan(style: const TextStyle(color: Colors.white, fontSize: 20), text: "${face.name}  ${face.distance.toStringAsFixed(2)}");
      TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(face.location.left * scaleX, face.location.top * scaleY));
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return true;
  }
}
