import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';


class ConvertImage{

  Future<String> convertCameraImageToFilePath(CameraImage cameraImage, int rotationDegrees) async {
    String path = "";
    try{
      // Convert the YUV420 image to RGB
      img.Image image = convertYUV420ToImage(cameraImage);

      // Rotate the image based on the required orientation
      img.Image rotatedImage = img.copyRotate(image, angle: rotationDegrees);

      // Get the temporary directory of the device to save the image file
      final Directory directory = await getTemporaryDirectory();
      final String filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

      // Encode the image to PNG and save it to the file
      File file = File(filePath);
      file.writeAsBytesSync(img.encodePng(rotatedImage));
      path = filePath;
    }catch (e){
      print("Testig ConvertImage : " + e.toString());
      return "Error";
    }
    return path;
  }


  Future<String> convertCameraImageToFilePathWithCropt(img.Image image, int rotationDegrees) async {
    String path = "";
    try{

      // Rotate the image based on the required orientation
      img.Image rotatedImage = img.copyRotate(image, angle: rotationDegrees);

      // Get the temporary directory of the device to save the image file
      final Directory directory = await getTemporaryDirectory();
      final String filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

      // Encode the image to PNG and save it to the file
      File file = File(filePath);
      file.writeAsBytesSync(img.encodePng(rotatedImage));
      path = filePath;
    }catch (e){
      print("Testig ConvertImage : " + e.toString());
      return "Error";
    }
    return path;
  }


  Future<File> convertCameraImageToFile(CameraImage cameraImage, int rotationDegrees) async {
    // Convert the YUV420 image to RGB
    img.Image image = convertYUV420ToImage(cameraImage);

    // Rotate the image based on the required orientation
    img.Image rotatedImage = img.copyRotate(image, angle: -90);

    // Get the temporary directory of the device to save the image file
    final Directory directory = await getTemporaryDirectory();
    final String filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';

    // Encode the image to PNG and save it to the file
    File file = File(filePath);
    file.writeAsBytesSync(img.encodePng(rotatedImage));

    return file;
  }

  // img.Image convertYUV420ToImage(CameraImage cameraImage) {
  //   final int width = cameraImage.width;
  //   final int height = cameraImage.height;
  //
  //   // Extract Y, U, and V planes
  //   final Uint8List yPlane = cameraImage.planes[0].bytes;
  //   final Uint8List uPlane = cameraImage.planes[1].bytes;
  //   final Uint8List vPlane = cameraImage.planes[2].bytes;
  //
  //   // Calculate the strides for U and V planes
  //   final int uRowStride = cameraImage.planes[1].bytesPerRow;
  //   final int vRowStride = cameraImage.planes[2].bytesPerRow;
  //
  //   // Create an empty RGB image
  //   img.Image imgRGB = img.Image(width: width,height:  height);
  //
  //   for (int y = 0; y < height; y++) {
  //     for (int x = 0; x < width; x++) {
  //       final int yIndex = y * width + x;
  //
  //       // Calculate chroma (U, V) indices
  //       final int uvIndex = (y ~/ 2) * (uRowStride ~/ 2) + (x ~/ 2);
  //
  //       // Get Y, U, and V values
  //       final int yValue = yPlane[yIndex];
  //       final int uValue = uPlane[uvIndex] - 128;
  //       final int vValue = vPlane[uvIndex] - 128;
  //
  //       // Convert YUV to RGB using standard conversion
  //       final r = (yValue + 1.402 * vValue).clamp(0, 255).toInt();
  //       final g = (yValue - 0.344136 * uValue - 0.714136 * vValue).clamp(0, 255).toInt();
  //       final b = (yValue + 1.772 * uValue).clamp(0, 255).toInt();
  //
  //       // Set pixel in RGB image using getColor
  //       // imgRGB.setPixel(x, y, img.getColor(r, g, b));
  //       imgRGB.setPixel(x, y,  img.ColorRgb8(r, g, b));
  //     }
  //   }
  //
  //   return imgRGB;
  // }

  img.Image convertYUV420ToImage(CameraImage cameraImage) {
    final int width = cameraImage.width;
    final int height = cameraImage.height;

    // Extract Y, U, and V planes
    final Uint8List yPlane = cameraImage.planes[0].bytes;
    final Uint8List uPlane = cameraImage.planes[1].bytes;
    final Uint8List vPlane = cameraImage.planes[2].bytes;

    final int yRowStride = cameraImage.planes[0].bytesPerRow;
    final int uRowStride = cameraImage.planes[1].bytesPerRow;
    final int vRowStride = cameraImage.planes[2].bytesPerRow;

    final int uvPixelStride = cameraImage.planes[1].bytesPerPixel!; // Usually 2

    // Create an empty RGB image
    img.Image imgRGB = img.Image( width: width, height: height);

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int yIndex = y * yRowStride + x;

        // Calculate the UV index with subsampling (chroma is half-resolution)
        final int uvIndex = (y ~/ 2) * uRowStride + (x ~/ 2) * uvPixelStride;

        // Get Y, U, and V values
        final int yValue = yPlane[yIndex];
        final int uValue = uPlane[uvIndex] - 128;
        final int vValue = vPlane[uvIndex] - 128;

        // YUV to RGB conversion formula
        final r = (yValue + 1.402 * vValue).clamp(0, 255).toInt();
        final g = (yValue - 0.344136 * uValue - 0.714136 * vValue).clamp(0, 255).toInt();
        final b = (yValue + 1.772 * uValue).clamp(0, 255).toInt();

        // Set the pixel color in the image
        // imgRGB.setPixel(x, y, img.getColor(r, g, b));
        imgRGB.setPixel(x, y, img.ColorUint8.rgb(r, g, b));
      }
    }
    return imgRGB;
  }
}