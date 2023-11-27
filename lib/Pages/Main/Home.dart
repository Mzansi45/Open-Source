import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Account/Account.dart';
import 'package:opensource/Pages/Posts/Post.dart';
import 'package:opensource/Pages/Posts/sharedPost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        toolbarHeight: MediaQuery.of(context).size.height * 0.04,
        leading: GestureDetector(
          child: const CircleAvatar(
            backgroundImage:
                NetworkImage('https://random.imagecdn.app/150/150'),
            radius: 20,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Account(),
              ),
            );
          },
        ),
        title: Text(
          'Username',
          style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'Search',
              color: ColorService.loadAndGetColor('iconColor'),
            ),
            onPressed: () {/*handle icon clicks*/},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              semanticLabel: 'Customization',
              color: ColorService.loadAndGetColor('iconColor'),
            ),
            onPressed: () {/*handle icon clicks*/},
          )
        ],
      ),
      body: Center(
        child: Container(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children:  <Widget>[
              Post(),
              SharedPost(),
            ],
          ),
        ),
      ),
    );
  }
}
