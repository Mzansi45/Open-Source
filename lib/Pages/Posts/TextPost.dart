import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TextPost extends StatefulWidget {
  const TextPost({super.key});

  @override
  State<TextPost> createState() => _TextPostState();
}

class _TextPostState extends State<TextPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(40, 229, 193, 30),
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
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
                  backgroundImage: NetworkImage(
                      'https://random.imagecdn.app/150/150'), // Placeholder image URL
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
                  setState(() {});
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
            Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              color: const Color.fromARGB(0, 158, 158,
                  158), // Placeholder content (picture, text, or video)
              child: const Center(
                  child:  ReadMoreText(
                    'The world is on the brink of destruction after a devastating ten-year war in the "shadow labyrinth." Desir Herrman is one of the last skilled magicians left standing, but even he is no match for the formidable foe threatening humanitys very existence. Just when hes certain the end has come, he is sent back in time to his early days of studying magic at the prestigious Hebrion Academy! With this rare second chance, Desir is determined to save not only himself but also the friends and comrades he once lost. Armed with the knowledge of what their future holds, can his efforts make a difference, or are they all doomed to relive the same terrible destiny? Based on the hit novel.',
                    trimLines: 4,
                    colorClickableText: Colors.blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '   Show more',
                    trimExpandedText: '   Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                        ),
                        
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )),
            ),
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
                )),
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
                    }, itemBuilder: (BuildContext bc) {
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
        ));
  }
}
