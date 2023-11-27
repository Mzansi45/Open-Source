import 'package:flutter/material.dart';
import 'package:opensource/Pages/Main/ImageView.dart';
import 'package:opensource/Pages/Main/Navigations.dart';
import 'package:opensource/Pages/Posts/AboutPost.dart';
import 'package:readmore/readmore.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PostWidget extends StatefulWidget {
  final String description;
  final List<Image> images;
  final bool isShared;

  const PostWidget({
    Key? key,
    required this.description,
    required this.images,
    required this.isShared,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool hasImages = widget.images.isNotEmpty;
    bool hasDescription = widget.description.isNotEmpty;
    bool hasTaggedPeople = true;

    return GestureDetector(
      onTap: () {
        //navigate to about post page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavigationHelper(child: AboutPost())),
        );
      },
      child: Container(
        child: Center(
          child: Container(
            child: Column(
              children: [
                // Description container (added condition)
                if (hasDescription)
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: GestureDetector(
                      child: ReadMoreText(
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        ),
                        widget.description,
                        trimLines: 4,
                        textAlign: TextAlign.center,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '   Show more',
                        trimExpandedText: '   Show less',
                        moreStyle:
                            const TextStyle(fontSize: 14, color: Colors.blue),
                        lessStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        //navigate to about post page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutPost()),
                        );

                        setState(() {});
                      },
                    ),
                  ),
                // Image row (added condition)
                if (hasImages)
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.images.length > 1)
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.chevron_left),
                              onPressed: () {
                                setState(() {
                                  index = (index - 1)
                                      .clamp(0, widget.images.length - 1);
                                });
                              },
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                          ),
                        Flexible(
                          flex: 4,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: widget.images.isEmpty
                                ? Container(
                                    child: const Center(
                                        child: CircularProgressIndicator()))
                                : GestureDetector(
                                    child: widget.images.isEmpty
                                        ? Container(
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : Image(
                                            image: widget.images[index].image,
                                            fit: BoxFit.scaleDown,
                                          ) /*widget.images[index]*/,
                                    onTap: () {
                                      //navigate to image view page
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ImageView(
                                          image: widget.images[index],
                                        ),
                                      ));
                                    },
                                  ),
                          ),
                        ),
                        if (widget.images.length > 1)
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {
                                setState(() {
                                  index = (index + 1)
                                      .clamp(0, widget.images.length - 1);
                                });
                              },
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (hasImages && widget.images.length > 1)
                  Text('Image ${index + 1} of ${widget.images.length}',
                      style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'))),

                //translate and people tagged

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //translate if has text
                    if (hasDescription && !widget.isShared)
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.translate),
                              onPressed: () {/*handle icon clicks*/},
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            Text('translate',
                                style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'))),
                          ],
                        ),
                      ),
                    const Spacer(),
                    //people tagged if has people tagged
                    if (hasTaggedPeople && !widget.isShared)
                      Container(
                          child: Row(
                        children: [
                          PopupMenuButton(
                              color: ColorService.loadAndGetColor(
                                  'secondaryBackgroundColor'),
                              icon: Icon(Icons.people,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                              onSelected: (value) {
                                // your logic
                                setState(() {});
                              },
                              itemBuilder: (BuildContext bc) {
                                return [
                                  PopupMenuItem(
                                    value: '/hello',
                                    child: Text("Person 1",
                                        style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor'))),
                                  ),
                                  PopupMenuItem(
                                    value: '/about',
                                    child: Text("Person 2",
                                        style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor'))),
                                  ),
                                  PopupMenuItem(
                                    value: '/contact',
                                    child: Text("Person 3",
                                        style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor'))),
                                  )
                                ];
                              }),
                          Text('3',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor'))),
                        ],
                      )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorService {
  static ColorService? _instance;
  Map<String, dynamic> _colorData = {};

  factory ColorService() {
    return _instance ??= ColorService._();
  }

  ColorService._();

  Future<void> loadColors() async {
    final String jsonString = await rootBundle.loadString('assets/colors.json');
    _colorData = json.decode(jsonString);
  }

  Color getColor(String key) {
    loadColors();

    final Map<String, dynamic>? colorMap = _colorData[key];
    print(key);
    print('colorMap');

    if (colorMap != null) {
      return Color.fromARGB(
        colorMap['alpha'],
        colorMap['red'],
        colorMap['green'],
        colorMap['blue'],
      );
    } else {
      // Return a default color or handle the case when the key is not found
      return Colors.black;
    }
  }

  static Color loadAndGetColor(String key) {
    /*ColorService colorService = ColorService();
    colorService.loadColors();
    return colorService.getColor(key);*/

    if (key == 'backgroundColor') {
      return Colors.black;
    } else if (key == 'textColor') {
      return Colors.white;
    } else if (key == 'iconColor') {
      return Colors.grey;
    } else if (key == 'selectedIconColor') {
      return Colors.orange;
    } else if (key == 'secondaryBackgroundColor') {
      return const Color.fromARGB(45, 255, 255, 255);
    } else if (key == 'borderColor') {
      return Colors.orange;
    } else if (key == 'senderMessageColor') {
      return const Color.fromARGB(92, 33, 149, 243);
    } else if (key == 'receiverMessageColor') {
      return const Color.fromARGB(92, 76, 175, 79);
    } else if (key == 'onlineTextColor') {
      return Colors.lightGreenAccent[400]!;
    } else if (key == 'secondaryTextColor') {
      return Colors.grey[400]!;
    } else {
      return Colors.black;
    }
  }
}
