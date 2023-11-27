import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImages extends StatefulWidget {
  const GetImages({super.key});

  @override
  State<GetImages> createState() => _GetImagesState();
}

class _GetImagesState extends State<GetImages> {
  final ImagePicker imagePicker = ImagePicker();
  late List<XFile> imageFileList = [];
  late List<Image> imageList = [];

  Future<List<Image>> convertXFilesToImages(List<XFile> xFiles) async {
    List<Image> images = [];

    for (XFile xFile in xFiles) {
      ByteData data = await xFile
          .readAsBytes()
          .then((bytes) => Uint8List.fromList(bytes).buffer.asByteData());
      Codec codec = await ui.instantiateImageCodec(Uint8List.view(data.buffer));
      FrameInfo frameInfo = await codec.getNextFrame();
      images.add(Image.memory(Uint8List.view(data.buffer)));
    }

    return images;
  }

  void selectImage() async {
    //set image source: gallery or camera

    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      setState(() {
        imageFileList = selectedImages;
        imageList = convertXFilesToImages(imageFileList) as List<Image>;
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                itemCount: imageFileList.length,
                itemBuilder: (context, index) {
                  return Image.file(
                    File(imageFileList[index].path),
                    fit: BoxFit.cover,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
              )),
          ElevatedButton(
            onPressed: selectImage,
            child: const Text('Select Image'),
          ),
        ]),
      ),
    );
  }
}
