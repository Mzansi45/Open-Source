import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Helper/HelperFunctions.dart';
import 'package:opensource/Pages/Inbox/ImagesGrid.dart';
import 'package:opensource/Pages/Main/ImageView.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Duration duration = const Duration(minutes: 2);
  Duration position = const Duration(seconds: 29);
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  List<Image> images = [];

  _ChatPageState() {
    // Add images to the list from assets
    for (int i = 1; i <= 100; i++) {
      int index = i % 3 + 1;
      images.add(
        Image.asset(
          'assets/$index.jpg',
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();

    Widget createTextMessage(String text, bool isSender, bool isTail,
        bool isSeen, bool isDelivered, bool isFailed) {
      Color? color;
      if (isSender) {
        color = ColorService.loadAndGetColor('senderMessageColor');
      } else {
        color = ColorService.loadAndGetColor('receiverMessageColor');
      }

      return BubbleSpecialThree(
        delivered: isDelivered,
        text: '$text '   ' ${now.hour.toString() + ':' + now.minute.toString()}' '',
        isSender: isSender,
        color: color,
        tail: isTail,
        sent: isFailed,
        seen: isSeen,
        textStyle: TextStyle(
          color: ColorService.loadAndGetColor('textColor'),
        ),
      );
    }

    Widget createImageMessage(List<Image> images, bool isSender, bool isTail,
        bool isSeen, bool isDelivered, bool isFailed) {
      Color? color;

      if (isSender) {
        color = ColorService.loadAndGetColor('senderMessageColor');
      } else {
        color = ColorService.loadAndGetColor('receiverMessageColor');
      }

      return BubbleNormalImage(
        id: '1',
        color: color,
        tail: isTail,
        sent: isFailed,
        seen: isSeen,
        delivered: isDelivered,
        isSender: isSender,
        image: images[2],
      );
    }

    Widget createMultipleImagesMessage(List<Image> images, bool isSender,
        bool isTail, bool isSeen, bool isDelivered, bool isFailed) {
      Color? color;

      if (isSender) {
        color = ColorService.loadAndGetColor('senderMessageColor');
      } else {
        color = ColorService.loadAndGetColor('receiverMessageColor');
      }

      if (isSender) {
        return Row(children: [
          Spacer(),
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(children: [
                ImagesGrid(images: images),
                Row(
                  children: [
                    Text(
                      now.hour.toString() + ':' + now.minute.toString(),
                      style: TextStyle(
                        color:
                            ColorService.loadAndGetColor('secondaryTextColor'),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    if (images.length > 9)
                      Text('(9+ images) ',
                          style: TextStyle(
                              color: ColorService.loadAndGetColor(
                                  'secondaryTextColor'))),
                    if (images.length <= 9)
                      Text('(${images.length} images) ',
                          style: TextStyle(
                              color: ColorService.loadAndGetColor(
                                  'secondaryTextColor'))),
                    Icon(
                      Icons.done_all,
                      color: ColorService.loadAndGetColor('secondaryTextColor'),
                    )
                  ],
                )
              ])),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ]);
      } else {
        return Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(children: [
              ImagesGrid(images: images),
              Row(
                children: [
                  if (images.length > 9)
                    Text('(9+ images) ',
                        style: TextStyle(
                            color: ColorService.loadAndGetColor(
                                'secondaryTextColor'))),
                  if (images.length <= 9)
                    Text('(${images.length} images) ',
                        style: TextStyle(
                            color: ColorService.loadAndGetColor(
                                'secondaryTextColor'))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                  ),
                  Text(
                    now.hour.toString() + ':' + now.minute.toString(),
                    style: TextStyle(
                      color: ColorService.loadAndGetColor('secondaryTextColor'),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ]),
          ),
          Spacer(),
        ]);
      }
    }

    Widget createAudioMessage(String url, bool isSender, bool isTail,
        bool isSeen, bool isDelivered, bool isFailed) {
      Color? color;
      if (isSender) {
        color = ColorService.loadAndGetColor('senderMessageColor');
      } else {
        color = ColorService.loadAndGetColor('receiverMessageColor');
      }

      return BubbleNormalAudio(
        color: color,
        tail: isTail,
        sent: isFailed,
        seen: isSeen,
        delivered: isDelivered,
        isSender: isSender,
        duration: duration.inSeconds.toDouble(),
        position: position.inSeconds.toDouble(),
        isPlaying: isPlaying,
        isLoading: isLoading,
        isPause: isPause,
        onSeekChanged: (value) {
          setState(() {
            position = Duration(seconds: value.toInt());
          });
        },
        onPlayPauseButtonClick: () {
          setState(() {
            isPlaying = !isPlaying;
          });
        },
      );
    }

    return Scaffold(
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: const CircleAvatar(
            backgroundImage:
                NetworkImage('https://random.imagecdn.app/150/150'),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.all(0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Username',
                style: TextStyle(
                    color: ColorService.loadAndGetColor('textColor'),
                    fontSize: 20)),
            Text('Online',
                style: TextStyle(
                    color: ColorService.loadAndGetColor('onlineTextColor'),
                    fontSize: 15)),
          ]),
        ),
        surfaceTintColor: ColorService.loadAndGetColor('backgroundColor'),
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: ColorService.loadAndGetColor('iconColor'),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: ColorService.loadAndGetColor('iconColor'),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: ColorService.loadAndGetColor('iconColor'),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                color: ColorService.loadAndGetColor('iconColor'),
              )),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              reverse: true,
              children: [
                createTextMessage(
                    'last message of the text', true, true, true, true, false),
                createAudioMessage('Hello', false, false, true, true, false),
                createImageMessage(images, true, true, true, true, true),
                createMultipleImagesMessage(
                    images, false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createMultipleImagesMessage(
                    images, true, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage('Hello', false, false, true, true, false),
                createTextMessage('Hello', true, false, true, true, false),
                createTextMessage(
                    'Last Message', false, false, true, true, false),
              ],
            )),
            Row(
              children: [
                
                PopupMenuButton(
                  color: ColorService.loadAndGetColor('backgroundColor'),
                  shadowColor:
                      ColorService.loadAndGetColor('secondaryBackgroundColor'),
                  icon: Icon(
                    Icons.add,
                    color: ColorService.loadAndGetColor('iconColor'),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Recording',
                      child: Row(children: [
                        Icon(
                          Icons.mic_none,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Recording",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'image',
                      child: Row(children: [
                        Icon(
                          Icons.image,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Image",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'video',
                      child: Row(children: [
                        Icon(
                          Icons.video_call,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Video",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'audio',
                      child: Row(children: [
                        Icon(
                          Icons.mic,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Audio",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'location',
                      child: Row(children: [
                        Icon(
                          Icons.location_on,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Location",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'contact',
                      child: Row(children: [
                        Icon(
                          Icons.contact_phone,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Contact",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'document',
                      child: Row(children: [
                        Icon(
                          Icons.document_scanner,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Document",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'gallery',
                      child: Row(children: [
                        Icon(
                          Icons.photo_library,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Gallery",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'camera',
                      child: Row(children: [
                        Icon(
                          Icons.camera_alt,
                          color: ColorService.loadAndGetColor('iconColor'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Camera",
                            style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'))),
                      ]),
                    ),
                  ],
                  onSelected: (value) {
                    HelperFunctions.showSnackBar(context, value.toString());
                  },
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      enableIMEPersonalizedLearning: true,
                      maxLines: 3,
                      minLines: 1,
                      style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor')),
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(
                            color: ColorService.loadAndGetColor(
                                'secondaryTextColor')),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: ColorService.loadAndGetColor(
                            'secondaryBackgroundColor'),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: ColorService.loadAndGetColor('iconColor'),
                          ),
                        ),
                        
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
