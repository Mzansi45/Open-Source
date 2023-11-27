import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Inbox/ChatsList.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
            appBar: AppBar(
              backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
              toolbarHeight: MediaQuery.of(context).size.height * 0.04,
              title: Text(
                'Username',
                style:
                    TextStyle(color: ColorService.loadAndGetColor('textColor')),
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
              bottom: TabBar(
                dividerColor: ColorService.loadAndGetColor('borderColor'),
                labelColor: ColorService.loadAndGetColor('textColor'),
                unselectedLabelColor: ColorService.loadAndGetColor('textColor'),
                indicatorColor: ColorService.loadAndGetColor('borderColor'),
                labelStyle: TextStyle(
                  color: ColorService.loadAndGetColor('borderColor'),
                ),
                tabs:  <Widget>[
                  Tab(
                    text: 'Chats',
                    icon: Icon(Icons.chat_bubble_outline, color: ColorService.loadAndGetColor('iconColor')),

                  ),
                  Tab(text: 'Groups', icon: Icon(Icons.group, color: ColorService.loadAndGetColor('iconColor'),)),
                  Tab(text: 'Status', icon: Icon(Icons.switch_access_shortcut_sharp, color: ColorService.loadAndGetColor('iconColor'))),
                  Tab(text: 'Calls', icon: Icon(Icons.call, color: ColorService.loadAndGetColor('iconColor'))),
                ],
              ),
            ),
            body: const TabBarView(
              children: <Widget>[
                // Content for 'Chats'
                Center(child: ChatsList()),

                // Content for 'Groups'
                Center(child: Text('Groups Content')),

                // Content for 'Status'
                Center(child: Text('Status Content')),

                // Content for 'Calls'
                Center(child: Text('Calls Content')),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              isExtended: false,
              
              backgroundColor: ColorService.loadAndGetColor('secondaryBackgroundColor'),
              shape: RoundedRectangleBorder(
                borderRadius:const BorderRadius.all(Radius.circular(50)),
                side: BorderSide(color: ColorService.loadAndGetColor('borderColor'), width: 2.0),
              ),
              child: Icon(Icons.add, color: ColorService.loadAndGetColor('borderColor'),),
            ),
          ),
        ),
      ),
    );
  }
}
