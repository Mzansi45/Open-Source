import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
String checkOverflow(String text, int maxCharacters) {
    if (text.length > maxCharacters) {
      return '${text.substring(0, maxCharacters)}...';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'Followers (${100})',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorService.loadAndGetColor('textColor')),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'Search',
                  color: ColorService.loadAndGetColor('iconColor'),
                ),
                onPressed: () {/*handle icon clicks*/},
              ),
              //popup menu
              PopupMenuButton(
                icon: Icon(Icons.more_vert,
                    color: ColorService.loadAndGetColor('iconColor')),
                itemBuilder: (BuildContext bc) {
                  return const [
                    PopupMenuItem(
                      value: '/hello',
                      child: Text("Remove all "),
                    ),
                    PopupMenuItem(
                      value: '/about',
                      child: Text("About"),
                    ),
                    PopupMenuItem(
                      value: '/contact',
                      child: Text("Contact"),
                    ),
                  ];
                },
                onSelected: (value) {
                  // your logic
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                ),
                title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    checkOverflow('Usernamethshhd', 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorService.loadAndGetColor('textColor'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.square,
                      size: 5,
                      color: ColorService.loadAndGetColor('iconColor'),
                    ),
                  ),
                  Icon(
                    Icons.verified_outlined,
                    color: ColorService.loadAndGetColor('borderColor'),
                    size: 18,
                  ),
                ],
              ),
                subtitle: Text('This is the subtitle',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor(
                            'secondaryTextColor'))),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person_remove_alt_1,
                        color: ColorService.loadAndGetColor('iconColor'),
                      ),
                      onPressed: () {/*handle icon clicks*/},
                    ),
                    //popup menu
                    PopupMenuButton(
                      color: ColorService.loadAndGetColor('backgroundColor'),
                      icon: Icon(Icons.more_vert,
                          color: ColorService.loadAndGetColor('iconColor')),
                      itemBuilder: (BuildContext bc) {
                        // message, remove, block, report, mute, hide, unfollow, copy link, share profile,
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.message, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Message", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.person_remove_alt_1, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Remove", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.block, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Block", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.report, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Report", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.volume_off, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Mute", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.visibility_off, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Hide", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.person_remove, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Unfollow", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.copy, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Copy link", style: TextStyle(color: ColorService.loadAndGetColor('textColor'))),
                              ],
                            )
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.share, color: ColorService.loadAndGetColor('iconColor')),
                                SizedBox(width: 10),
                                Text("Share profile", style: TextStyle(color: ColorService.loadAndGetColor('textColor')),),
                              ],
                            )
                          ),

                        ];
                      },
                      onSelected: (value) {
                        // your logic
                        setState(() {});
                      },
                    ),
                  ],
                )
              );
            },
          ),
        ),
      ]),
    );
  }
}
