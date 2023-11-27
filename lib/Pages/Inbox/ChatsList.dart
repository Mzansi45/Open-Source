import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Pages/Inbox/ChatPage.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({super.key});

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ListView(
        children: const [
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
          ChatWidget(),
        ],
      )),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigate to chatpage
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(),
              ),
            );
      },
      child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: ColorService.loadAndGetColor('backgroundColor'),
            borderRadius: BorderRadius.circular(15.0),
            border:
                Border.all(color: ColorService.loadAndGetColor('borderColor')),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://random.imagecdn.app/150/150'), // Placeholder image URL
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorService.loadAndGetColor('textColor')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor')),
                            text: 'A message from  A very long text :)')),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorService.loadAndGetColor('borderColor')),
                    child: const Text('5', style: TextStyle(fontSize: 10)),
                  ),
                  Text(
                    '12:00',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor('iconColor')),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
