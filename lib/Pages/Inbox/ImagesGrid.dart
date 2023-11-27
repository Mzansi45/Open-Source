import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Main/ImageView.dart';

class ImagesGrid extends StatefulWidget {
  List<Image> images;

  ImagesGrid({super.key, required this.images});

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {

  double calculateHeight()
  {
    if(widget.images.length<=3)
    {
      return MediaQuery.of(context).size.height * 0.11;
    }
    else if(widget.images.length<=6)
    {
      return MediaQuery.of(context).size.height * 0.21;
    }
    else
    {
      return MediaQuery.of(context).size.height * 0.31;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calculateHeight(),
      width: MediaQuery.of(context).size.width*0.7,

      
      
      child: Center(
          //grid view here
          child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(widget.images.length, (index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorService.loadAndGetColor('secondaryBackgroundColor'),
                border: Border.all(
                    color: ColorService.loadAndGetColor('borderColor'))),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageView(
                        image: widget.images[index],
                      ),
                    ),
                  );
                },
                child: widget.images[index],  
              )
            ),
          );
        }),
      )),
    );
  }
}
