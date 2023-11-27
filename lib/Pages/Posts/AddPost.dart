import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Main/ImageView.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController _descriptionController;

  final ImagePicker imagePicker = ImagePicker();
  late List<XFile> imageFileList = [];
  late List<Image> imageList = [];

  Future<List<Image>> convertXFilesToImages(List<XFile> xFiles) async {
    List<Image> images = [];

    for (XFile xFile in xFiles) {
      ByteData data = await xFile
          .readAsBytes()
          .then((bytes) => Uint8List.fromList(bytes).buffer.asByteData());
      images
          .add(Image.memory(Uint8List.view(data.buffer).buffer.asUint8List()));
    }

    return images;
  }

  void selectSingleImage() async {
    // set image source: gallery or camera
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      List<Image> convertedImages =
          await convertXFilesToImages([selectedImage]);

      setState(() {
        imageFileList = [selectedImage];
        imageList = convertedImages;
      });
    }
  }

  void selectImage() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      List<Image> convertedImages = await convertXFilesToImages(selectedImages);

      setState(() {
        imageFileList = selectedImages;
        imageList = convertedImages;
      });
    }
  }

  /// get an image from the camera
  void captureImage() async {
    final XFile? photo =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      List<Image> convertedImages = await convertXFilesToImages([photo]);

      setState(() {
        imageFileList = [photo];
        imageList = convertedImages;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        title: Text('Create Post',
            style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: ColorService.loadAndGetColor('iconColor'),
                ),
              ),
              
            ],
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'long press on image to remove it',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            if (imageFileList.length == 1)
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    // Remove the image at the long-pressed index
                    imageFileList.removeAt(0);
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageView(
                        image: imageList[0],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Image.file(
                    File(imageFileList[0].path),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            if (imageFileList.length > 1)
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: imageFileList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          setState(() {
                            // Remove the image at the long-pressed index
                            imageFileList.removeAt(index);
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageView(
                                image: imageList[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.file(
                            File(imageFileList[index].path),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                  )),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorService.loadAndGetColor('borderColor'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      selectSingleImage();
                    },
                    icon: Icon(Icons.photo,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(Icons.photo_library_outlined,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {
                      captureImage();
                    },
                    icon: Icon(Icons.camera_alt,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.video_call,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.gif,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return EmojiPicker(
                            onEmojiSelected: (category, emoji) {
                              _descriptionController.text += emoji.emoji;
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.emoji_emotions,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_on,
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: _descriptionController,
              style: TextStyle(
                  color: ColorService.loadAndGetColor('textColor'),
                  decorationColor: ColorService.loadAndGetColor('textColor'),
                  
                  ),
              
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
