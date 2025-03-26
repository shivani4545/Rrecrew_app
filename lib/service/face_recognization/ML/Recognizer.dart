import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;


class Recognizer {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;
  static const int WIDTH = 112;
  static const int HEIGHT = 112;

  static const threshold = 0.80;

  @override
  String get modelName => 'assets/facenet.tflite';

  Recognizer({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }
    loadModel();
  }

  void registerFaceInDB(String name, List<double> embedding) async {
    if (kDebugMode) {
      print("Testing  Name: $name Embedding: ${embedding.join(",")}");
    }
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(modelName);
    } catch (e) {
      if (kDebugMode) {
        print('Testing Unable to create interpreter, Caught Exception: ${e.toString()}');
      }
    }
  }

  List<dynamic> imageToArray(img.Image inputImage){
    img.Image resizedImage = img.copyResize(inputImage, width: WIDTH, height: HEIGHT);
    List<double> flattenedList = resizedImage.data!.expand((channel) => [channel.r, channel.g, channel.b]).map((value) => value.toDouble()).toList();
    Float32List float32Array = Float32List.fromList(flattenedList);
    int channels = 3;
    int height = HEIGHT;
    int width = WIDTH;
    Float32List reshapedArray = Float32List(1 * height * width * channels);
    for (int c = 0; c < channels; c++) {
      for (int h = 0; h < height; h++) {
        for (int w = 0; w < width; w++) {
          int index = c * height * width + h * width + w;
          reshapedArray[index] = (float32Array[c * height * width + h * width + w]-127.5)/127.5;
        }
      }
    }
    return reshapedArray.reshape([1,112,112,3]);
  }

  List<double> getEmbeddingRecognize(img.Image image,Rect location) {
    var input = imageToArray(image);
    List output = List.filled(1*512, 0).reshape([1,512]);
    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(input, output);
    final run = DateTime.now().millisecondsSinceEpoch - runs;
    List<double> outputArray = output.first.cast<double>();

    return outputArray;
  }


  // TODO  looks for the nearest embeeding in the database and returns the pair which contain information of registered face with which face is most similar
  findNearest(List<double> emb , List<List<double>> originalEmbedding){
    Pair pair = Pair(emb.toString(),originalEmbedding.toString(), -5.00000000000001 , false);

    // print(registered.entries);
    for (List<double> org in originalEmbedding) {
      // final String name = item.value.name;
      // final String id = item.value.id;
      List<double> knownEmb = org;
      double distance = 0;
      for (int i = 0; i < knownEmb.length; i++) {
        double diff = emb[i] - knownEmb[i];
        distance += diff*diff;
      }
      if(distance == 0) {
        return pair;
      }
      distance = sqrt(distance);
      if (pair.distance == -5.00000000000001 || distance < pair.distance) {
        pair.distance = distance;
        if(distance < threshold){
          pair.value = true;
        }else{
          pair.value = false;
        }
      }
    }
    return pair;

  }

  void close() {
    interpreter.close();
  }

}

class Pair{
  String emd;
  String orgEmd;
  double distance;
  bool value;
  Pair(this.emd, this.orgEmd,this.distance , this.value);
}
