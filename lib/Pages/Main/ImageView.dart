import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {
  final Image image;

  const ImageView({super.key, required this.image});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
          title: Text(
            'Image View',
            style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              semanticLabel: 'Back',
              color: ColorService.loadAndGetColor('iconColor'),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          surfaceTintColor: ColorService.loadAndGetColor('backgroundColor'),
          backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: ColorService.loadAndGetColor('iconColor'),
                )),
            IconButton(
                onPressed: () {
                  //save image on device
                  
                },
                icon: Icon(
                  Icons.download,
                  color: ColorService.loadAndGetColor('iconColor'),
                )),
          ]),
      body: Center(
        child: Container(
          child: PhotoView(
            maxScale: PhotoViewComputedScale.covered * 2.0,
            minScale: PhotoViewComputedScale.contained * 0.8,
            initialScale: PhotoViewComputedScale.covered,
            enableRotation: true,
            backgroundDecoration: BoxDecoration(
              color: ColorService.loadAndGetColor('backgroundColor'),
            ),
            loadingBuilder: (context, event) =>
                const Center(child: CircularProgressIndicator()),
            imageProvider: widget.image.image,
          ),
        ),
      ),
    );
  }
}
