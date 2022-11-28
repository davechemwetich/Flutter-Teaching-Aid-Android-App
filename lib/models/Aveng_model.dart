import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class AvengModel extends StatefulWidget {
  const AvengModel({Key key}) : super(key: key);

  @override
  State<AvengModel> createState() => _AvengModelState();
}

class _AvengModelState extends State<AvengModel> {
  Future<File> imageFile;
  File _image;
  String result = '';
  ImagePicker imagePicker;

  ///ImageSource: Gallery.
  selectPhotoFromGallerry() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    setState(() {
      // ignore: unnecessary_statements
      _image;
      doImageClassification();
    });
  }

  ///ImageSource: Camera
  captutePhotoFromCamera() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
    setState(() {
      // ignore: unnecessary_statements
      _image;
      captutePhotoFromCamera();
    });
  }

  loadDataModelFiles() async {
    String output = await Tflite.loadModel(
      model: 'assets/aveng/model_unquant.tflite',
      labels: 'assets/aveng/labelss.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    // ignore: avoid_print
    print(output);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
      path: _image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2, //result per image prediction
      threshold: 0.1,
      asynch: true,
    );
    // ignore: avoid_print
    print(recognitions.length.toString());
    setState(() {
      result = '';
    });
    // ignore: avoid_function_literals_in_foreach_calls
    recognitions.forEach((element) {
      setState(() {
        // ignore: avoid_print
        print(element.toString());
        result += element['label'] + '\n\n';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        // ),
        child: Column(
          children: [
            const SizedBox(
              width: 100.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Center(
                      child: TextButton(
                    onPressed: selectPhotoFromGallerry,
                    onLongPress: captutePhotoFromCamera,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 30.0, right: 35.0, left: 18.0),
                      child: _image != null
                          ? Image.file(
                              _image,
                              height: 360.0,
                              width: 400.0,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 140.0,
                              height: 190.0,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.black,
                              )),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 160.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pinkAccent,
                    backgroundColor: Colors.greenAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
