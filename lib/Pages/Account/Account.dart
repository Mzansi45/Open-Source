import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Account/Followers.dart';
import 'package:opensource/Pages/Account/Following.dart';
import 'package:opensource/Pages/Account/PersonalInfo.dart';
import 'package:opensource/Pages/Main/ImageView.dart';
import 'package:opensource/Pages/Posts/Post.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Image image = Image.network('https://random.imagecdn.app/150/150');

  List<Widget> pages = <Widget>[
    const Post(),
    const Post(),
    const Post(),
    const Post(),
    const Post(),
    const Post(),
    const Post(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorService.loadAndGetColor('iconColor'),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        title: Text(
          'Account',
          style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
        ),
        actions: <Widget>[
          PopupMenuButton(
            color: ColorService.loadAndGetColor('secondaryBackgroundColor'),
            icon: Icon(
              Icons.more_vert,
              color: ColorService.loadAndGetColor('iconColor'),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: ColorService.loadAndGetColor('iconColor'),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor('textColor')),
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: ColorService.loadAndGetColor('iconColor'),
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor('textColor')),
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    Icons.help,
                    color: ColorService.loadAndGetColor('iconColor'),
                  ),
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor('textColor')),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageView(
                                image: image,
                              )),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 100.0,
                    backgroundImage:
                        NetworkImage('https://random.imagecdn.app/150/150'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorService.loadAndGetColor(
                          'textColor')), //TextStyle
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available',
                  style: TextStyle(
                      color: ColorService.loadAndGetColor(
                          'textColor')), //TextStyle
                ),
              ),
              Container(
                margin: const EdgeInsets.all(3),
                  child: Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor'))),
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Row(
                        children: [
                          Icon(Icons.mode_edit_outlined,
                              color: ColorService.loadAndGetColor('iconColor')),
                          Flexible(
                              child: Text(
                            ' Edit Profile',
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            ),
                          ))
                        ],
                      )),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor'))),
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Row(
                        children: [
                          Icon(Icons.settings_outlined,
                              color: ColorService.loadAndGetColor('iconColor')),
                          Flexible(
                              child: Text(
                            '  Settings',
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            ),
                          ))
                        ],
                      )),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          border: Border.all(
                              color:
                                  ColorService.loadAndGetColor('borderColor'))),
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PersonalInfo()),
                          );
                        },
                          child: Row(
                        children: [
                          Icon(Icons.drive_file_rename_outline_sharp,
                              color: ColorService.loadAndGetColor('iconColor')),
                          Flexible(
                              child: Text(
                            '  About',
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            ),
                          ))
                        ],
                      )),
                    ),
                  ),
                ],
              )),
              // tab bar view here
              Container(
                margin: const EdgeInsets.all(5),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          dividerColor:
                              ColorService.loadAndGetColor('borderColor'),
                          labelColor: ColorService.loadAndGetColor('textColor'),
                          unselectedLabelColor:
                              ColorService.loadAndGetColor('textColor'),
                          indicatorColor:
                              ColorService.loadAndGetColor('borderColor'),
                          tabs: const [
                            Tab(
                              text: 'Posts ${20}',
                            ),
                            Tab(
                              text: 'Photos ${20}',
                            ),
                            Tab(
                              text: 'Followers ${20}',
                            ),
                            Tab(
                              text: 'Following ${20}',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(
                          children: [
                            Container(
                              child: Center(
                                child: ListView(
                                  children: pages,
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                  //grid view here
                                  child: GridView.count(
                                crossAxisCount: 4,
                                children: List.generate(20, (index) {
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorService.loadAndGetColor(
                                            'secondaryBackgroundColor'),
                                        border: Border.all(
                                            color: ColorService.loadAndGetColor(
                                                'borderColor'))),
                                    child: Center(
                                      child: Text(
                                        'Item $index',
                                        style: TextStyle(
                                            color: ColorService.loadAndGetColor(
                                                'textColor')),
                                      ),
                                    ),
                                  );
                                }),
                              )),
                            ),
                            Container(
                              child: Center(
                                child: Followers(),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Following(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
