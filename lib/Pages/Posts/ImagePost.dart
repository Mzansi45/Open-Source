import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import 'package:readmore/readmore.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({Key? key}) : super(key: key);

  @override
  State<ImagePost> createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  late List<Image> images;
  int index = 0;
  String description = 'description';
  var selectedItem = '';

  @override
  void initState() {
    super.initState();
    images = [];
    fetchImages();
  }

  Future<void> fetchImages() async {
    for (int i = 0; i < 10; i++) {
      try {
        final Image image =
            await fetchImage('https://random.imagecdn.app/400/400');
        setState(() {
          images.add(image);
        });
      } catch (e) {
        print('Error fetching image: $e');
      }
    }
  }

  Future<Image> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Convert the response body to Uint8List
      final Uint8List bytes = response.bodyBytes;

      // Decode the bytes to an Image widget
      final Image image = Image.memory(bytes);

      return image;
    } else {
      // If the request fails, return a placeholder or handle the error accordingly
      return Image.asset(
          'assets/placeholder_image.png'); // Replace with your placeholder image asset
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 229, 193, 30),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              const CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage('https://random.imagecdn.app/150/150'), // Placeholder image URL
              ),
              const SizedBox(width: 10.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PopupMenuButton(onSelected: (value) {
                // your logic
                setState(() {
                  selectedItem = value.toString();
                  description = selectedItem;
                });
              }, itemBuilder: (BuildContext bc) {
                return const [
                  PopupMenuItem(
                    value: '/hello',
                    child: Text("Hello"),
                  ),
                  PopupMenuItem(
                    value: '/about',
                    child: Text("About"),
                  ),
                  PopupMenuItem(
                    value: '/contact',
                    child: Text("Contact"),
                  )
                ];
              })
            ],
          ),
          const SizedBox(height: 10.0),

          // Start post
          Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: ReadMoreText(
                    description,
                    trimLines: 3,
                    textAlign: TextAlign.center,
                    colorClickableText: Colors.blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '   Show more',
                    trimExpandedText: '   Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                        ),
                        
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 1,
                          child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          setState(() {
                            if (index > 0) {
                              index--;
                            }
                          });
                        },
                      )),
                      Flexible(
                        flex: 4,
                        child: Container(
                          child: images.isEmpty
                              ? Container(
                                  child: const Center(
                                      child: CircularProgressIndicator()))
                              : FullScreenWidget(
                                  backgroundIsTransparent: true,
                                  disposeLevel: DisposeLevel.High,
                                  child: images[index]),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            setState(() {
                              if (index < images.length - 1) {
                                index++;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Text('Image ${index + 1} of ${images.length}'),
                ],
              ),
            ),
          ),

          // End of post
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Widget at the start
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.translate),
                      onPressed: () {/*handle icon clicks*/},
                    ),
                    const Text('translate')
                  ],
                ),
              ),
              const Spacer(),
              // Widget at the end
              Container(
                  child: Row(
                children: [
                  PopupMenuButton(
                      icon: const Icon(Icons.people),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      onSelected: (value) {
                        // your logic
                        setState(() {});
                      },
                      itemBuilder: (BuildContext bc) {
                        return const [
                          PopupMenuItem(
                            value: '/hello',
                            child: Text("Person 1"),
                          ),
                          PopupMenuItem(
                            value: '/about',
                            child: Text("Person 2"),
                          ),
                          PopupMenuItem(
                            value: '/contact',
                            child: Text("Person 3"),
                          )
                        ];
                      }),
                  const Text('3')
                ],
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text('123'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Icon(Icons.comment, color: Colors.grey),
                    Text('45'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Icon(Icons.share, color: Colors.grey),
                    Text('12'),
                  ],
                ),
              ),
              const Spacer(),
              const Text('2 hours ago', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
