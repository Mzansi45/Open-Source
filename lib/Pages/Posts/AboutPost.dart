import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';

class AboutPost extends StatefulWidget {
  const AboutPost({super.key});

  @override
  State<AboutPost> createState() => _AboutPostState();
}

class _AboutPostState extends State<AboutPost> {
  List<Image> images = [];

  _AboutPostState() {
    // Add images to the list from assets
    for (int i = 1; i <= 4; i++) {
      images.add(
        Image.asset(
          'assets/$i.jpg',
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: ColorService.loadAndGetColor('iconColor')),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Post by Username',
          style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
        ),
        centerTitle: true,
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorService.loadAndGetColor('backgroundColor'),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: CommentTreeWidget<Comment, Comment>(
            Comment(
                avatar: 'https://random.imagecdn.app/150/150',
                userName: 'Mzansi45',
                content:
                    'A Dart template generator wh  A Dart template genera'),
            [
              Comment(
                avatar: 'https://random.imagecdn.app/150/150',
                userName: 'Person 1',
                content:
                    'A Dart \ntemplate \ngenerator \nwhich \nhelps \nteams',
              ),
              Comment(
                  avatar: 'https://random.imagecdn.app/150/150',
                  userName: 'Person 2',
                  content:
                      'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
              Comment(
                  avatar: 'https://random.imagecdn.app/150/150',
                  userName: 'Person 3',
                  content: 'A Dart template generator which helps teams'),
              Comment(
                  avatar: 'https://random.imagecdn.app/150/150',
                  userName: 'Person 4',
                  content:
                      'A Dart template generator which helps teams generator which helps teams '),
            ],
            treeThemeData: TreeThemeData(
                lineColor: ColorService.loadAndGetColor('borderColor'),
                lineWidth: 2),
            avatarRoot: (context, data) => PreferredSize(
              preferredSize: const Size.fromRadius(18),
              child: CircleAvatar(
                radius: 18,
                backgroundColor:
                    ColorService.loadAndGetColor('secondaryBackgroundColor'),
                backgroundImage: NetworkImage(
                    data.avatar ?? 'https://random.imagecdn.app/150/150'),
              ),
            ),
            avatarChild: (context, data) => PreferredSize(
              preferredSize: const Size.fromRadius(12),
              child: CircleAvatar(
                radius: 12,
                backgroundColor:
                    ColorService.loadAndGetColor('secondaryBackgroundColor'),
                backgroundImage: NetworkImage(
                    data.avatar ?? 'https://random.imagecdn.app/150/150'),
              ),
            ),
            contentChild: (context, data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorService.loadAndGetColor('borderColor')),
                        color: ColorService.loadAndGetColor(
                            'secondaryBackgroundColor'),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 30,),
                                Text(
                                  data.userName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            //popup menu
                            PopupMenuButton(
                                onSelected: (value) {
                                  // your logic
                                  setState(() {});
                                },
                                icon: Icon(Icons.more_vert,
                                    color: ColorService.loadAndGetColor(
                                        'iconColor')),
                                color: ColorService.loadAndGetColor(
                                    'secondaryBackgroundColor'),
                                itemBuilder: (BuildContext bc) {
                                  return [
                                    PopupMenuItem(
                                      value: '/hello',
                                      child: Text("Hello",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    ),
                                    PopupMenuItem(
                                      value: '/about',
                                      child: Text("About",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    ),
                                    PopupMenuItem(
                                      value: '/contact',
                                      child: Text("Contact",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    )
                                  ];
                                })
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        PostWidget(
                            description: data.content.toString(),
                            images: List.empty(), isShared: false,),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor')),
                          color: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.favorite_border,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor'))),
                            ]),
                          ),
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.comment,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor'))),
                            ]),
                          ),
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.share,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor')))
                            ]),
                          ),
                          const Flexible(child: Spacer()),
                          Flexible(
                              child: Text('2h ago',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor')))),
                        ],
                      )),
                ],
              );
            },
            contentRoot: (context, data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorService.loadAndGetColor('borderColor')),
                        color: ColorService.loadAndGetColor(
                            'backgroundColor'),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 30,),
                                Text(
                                  data.userName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorService.loadAndGetColor(
                                          'textColor')),
                                ),
                              ],
                            ),
                            const Spacer(),
                            //popup menu
                            PopupMenuButton(
                                onSelected: (value) {
                                  // your logic
                                  setState(() {});
                                },
                                icon: Icon(Icons.more_vert,
                                    color: ColorService.loadAndGetColor(
                                        'iconColor')),
                                color: ColorService.loadAndGetColor(
                                    'secondaryBackgroundColor'),
                                itemBuilder: (BuildContext bc) {
                                  return [
                                    PopupMenuItem(
                                      value: '/hello',
                                      child: Text("Hello",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    ),
                                    PopupMenuItem(
                                      value: '/about',
                                      child: Text("About",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    ),
                                    PopupMenuItem(
                                      value: '/contact',
                                      child: Text("Contact",
                                          style: TextStyle(
                                              color:
                                                  ColorService.loadAndGetColor(
                                                      'borderColor'))),
                                    )
                                  ];
                                })
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        PostWidget(
                            description: data.content.toString(),
                            images: images, isShared: false,)
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor')),
                          color: ColorService.loadAndGetColor(
                              'backgroundColor'),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.favorite_border,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor'))),
                            ]),
                          ),
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.comment,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor'))),
                            ]),
                          ),
                          Flexible(
                            child: Row(children: [
                              Icon(Icons.share,
                                  size: 18,
                                  color: ColorService.loadAndGetColor(
                                      'iconColor')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('23',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor')))
                            ]),
                          ),
                          const Flexible(child: Spacer()),
                          Flexible(
                              child: Text('2h ago',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor')))),
                        ],
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
