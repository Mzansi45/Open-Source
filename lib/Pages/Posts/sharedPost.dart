import 'package:comment_tree/data/comment.dart';
import 'package:flutter/material.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Helper/HelperFunctions.dart';

class SharedPost extends StatefulWidget {
  const SharedPost({super.key});

  @override
  State<SharedPost> createState() => _SharedPostState();
}

class _SharedPostState extends State<SharedPost> {
List<Image> images = [Image.network('https://random.imagecdn.app/500/500'), 
                      Image.network('https://random.imagecdn.app/550/500'), 
                      Image.network('https://random.imagecdn.app/600/500'),
                      Image.network('https://random.imagecdn.app/400/500'), 
                      Image.network('https://random.imagecdn.app/300/500'), 
                      Image.network('https://random.imagecdn.app/800/500'),
                      ];

  String checkOverflow(String text, int maxCharacters) {
    if (text.length > maxCharacters) {
      return '${text.substring(0, maxCharacters)}...';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    var hasTaggedPeople = true;
    var hasDescription = true;
    return Container(
        decoration: BoxDecoration(
          color: ColorService.loadAndGetColor('backgroundColor'),
          borderRadius: BorderRadius.circular(20.0),
          border:
              Border.all(color: ColorService.loadAndGetColor('borderColor')),
        ),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            CommentTreeWidget<Comment, Comment>(
              Comment(
                  avatar: 'https://random.imagecdn.app/150/150',
                  userName: 'Parent Post',
                  content: 'In this example, the saveImage function takes an image URL as a parameter, checks if the image is already cached, and either downloads it or copies it from the cache. The saved file path is then displayed in a snackbar.'),
              [
                Comment(
                  avatar: 'https://random.imagecdn.app/150/150',
                  userName: 'Child Post',
                  content: 'person whose post is shared',
                ),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor')),
                          color:
                              ColorService.loadAndGetColor('backgroundColor'),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    checkOverflow('Usernamethshhd', 5),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorService.loadAndGetColor(
                                          'textColor'),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: ColorService.loadAndGetColor(
                                          'iconColor'),
                                    ),
                                  ),
                                  Icon(
                                    Icons.verified_outlined,
                                    color: ColorService.loadAndGetColor(
                                        'borderColor'),
                                    size: 18,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  //show snackbar with location
                                  HelperFunctions.showSnackBar(
                                      context, 'Location of the post');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorService.loadAndGetColor(
                                        'secondaryBackgroundColor'),
                                    border: Border.all(
                                        color: ColorService.loadAndGetColor(
                                            'borderColor')),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Icon(
                                            Icons.pin_drop_outlined,
                                            size: 14,
                                            color: ColorService.loadAndGetColor(
                                                'iconColor'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Flexible(
                                            child: Text(
                                          checkOverflow('location', 5),
                                          style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor'),
                                            fontSize: 12,
                                          ),
                                        )),
                                      ]),
                                ),
                              ),
                              PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color:
                                      ColorService.loadAndGetColor('iconColor'),
                                ),
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    child: Text('Edit'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
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
                  ],
                );
              },
              contentRoot: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    checkOverflow('Usernamethshhd', 9),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorService.loadAndGetColor(
                                          'textColor'),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 5,
                                      color: ColorService.loadAndGetColor(
                                          'iconColor'),
                                    ),
                                  ),
                                  Icon(
                                    Icons.verified_outlined,
                                    color: ColorService.loadAndGetColor(
                                        'borderColor'),
                                    size: 18,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  //show snackbar with location
                                  HelperFunctions.showSnackBar(
                                      context, 'Location of the post');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorService.loadAndGetColor(
                                        'secondaryBackgroundColor'),
                                    border: Border.all(
                                        color: ColorService.loadAndGetColor(
                                            'borderColor')),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Icon(
                                            Icons.pin_drop_outlined,
                                            size: 14,
                                            color: ColorService.loadAndGetColor(
                                                'iconColor'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Flexible(
                                            child: Text(
                                          checkOverflow('location', 5),
                                          style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor'),
                                            fontSize: 12,
                                          ),
                                        )),
                                      ]),
                                ),
                              ),
                              PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color:
                                      ColorService.loadAndGetColor('iconColor'),
                                ),
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    child: Text('Edit'),
                                  ),
                                  const PopupMenuItem(
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          PostWidget(
                              description: data.content.toString(),
                              images: images, isShared: true,)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //translate if has text
                    if (hasDescription)
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
                    if (hasTaggedPeople)
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(children: [
                    Icon(Icons.favorite_border,
                        size: 18,
                        color: ColorService.loadAndGetColor('iconColor')),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('23',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                  ]),
                ),
                Flexible(
                  child: Row(children: [
                    Icon(Icons.comment,
                        size: 18,
                        color: ColorService.loadAndGetColor('iconColor')),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('23',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                  ]),
                ),
                Flexible(
                  child: Row(children: [
                    Icon(Icons.replay_outlined,
                        size: 18,
                        color: ColorService.loadAndGetColor('iconColor')),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('23',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                  ]),
                ),
                Flexible(
                  child: Row(children: [
                    Icon(Icons.share,
                        size: 18,
                        color: ColorService.loadAndGetColor('iconColor')),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('23',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                  ]),
                ),
                const Flexible(child: Spacer()),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text('2h ago',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            ColorService.loadAndGetColor('secondaryTextColor'),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
