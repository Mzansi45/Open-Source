import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Inbox/ChatPage.dart';
import 'package:opensource/Pages/Inbox/Chats.dart';
import 'package:opensource/Pages/Main/Home.dart';
import 'package:opensource/Pages/Posts/AddPost.dart';
import 'package:opensource/Pages/Posts/GetImage.dart';
import 'package:opensource/Pages/Posts/TextPost.dart';
import 'package:badges/badges.dart' as badges;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPageIndex = 0;
  List<Widget> pages = <Widget>[
    const Home(),
    const Chats(),
    const AddPost(),
    const GetImages(),
    const TextPost(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        appBar: AppBar(
          backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
          title: Text(
            'Open Source',
            style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.cloudy_snowing,
                semanticLabel: 'Weather',
                color: ColorService.loadAndGetColor('iconColor'),
              ),
              onPressed: () {/*handle icon clicks*/},
            ),
            IconButton(
              icon: Icon(
                Icons.newspaper,
                semanticLabel: 'News',
                color: ColorService.loadAndGetColor('iconColor'),
              ),
              onPressed: () {/*handle icon clicks*/},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                semanticLabel: 'Shopping',
                color: ColorService.loadAndGetColor('iconColor'),
              ),
              onPressed: () {/*handle icon clicks*/},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                semanticLabel: 'Customization',
                color: ColorService.loadAndGetColor('iconColor'),
              ),
              onPressed: () {/*handle icon clicks*/},
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: pages[currentPageIndex],
          ),
        ),
        bottomNavigationBar: Container(
          color: ColorService.loadAndGetColor('secondaryBackgroundColor'),
          child: NavigationBar(
            backgroundColor:
                ColorService.loadAndGetColor('SecondaryBackgroundColor'),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor:
                ColorService.loadAndGetColor('secondaryBackgroundColor'),
            shadowColor: Colors.white,
            surfaceTintColor: Colors.red,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: ColorService.loadAndGetColor('selectedIconColor'),
                ),
                icon: Icon(Icons.home_outlined,
                    color: ColorService.loadAndGetColor('iconColor')),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.chat,
                    color: ColorService.loadAndGetColor('selectedIconColor')),
                icon: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      padding: EdgeInsets.all(2),
                      badgeGradient: badges.BadgeGradient.linear(
                        colors: [
                          Colors.purple,
                          Colors.blue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    position: badges.BadgePosition.topEnd(top: -10, end: -10),
                    badgeContent: Text(
                      '9+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    child: Icon(Icons.chat_outlined,
                        color: ColorService.loadAndGetColor('iconColor'))),
                label: 'Chat',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.post_add,
                    color: ColorService.loadAndGetColor('selectedIconColor')),
                icon: Icon(Icons.post_add_outlined,
                    color: ColorService.loadAndGetColor('iconColor')),
                label: 'Post',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.notifications,
                    color: ColorService.loadAndGetColor('selectedIconColor')),
                icon: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      padding: EdgeInsets.all(2),
                      badgeGradient: badges.BadgeGradient.linear(
                        colors: [
                          Colors.purple,
                          Colors.blue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    position: badges.BadgePosition.topEnd(top: -5, end: -5),
                    badgeContent: Text(
                      '9+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    child: Icon(Icons.notifications_outlined,
                        color: ColorService.loadAndGetColor('iconColor'))),
                label: 'Notifications',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person,
                    color: ColorService.loadAndGetColor('selectedIconColor')),
                icon: Icon(Icons.person_outlined,
                    color: ColorService.loadAndGetColor('iconColor')),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
