import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:opensource/Helper/HelperFunctions.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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
      decoration: BoxDecoration(
        color: ColorService.loadAndGetColor('backgroundColor'),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: ColorService.loadAndGetColor('borderColor')),
      ),
      margin: const EdgeInsets.all(10.0),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    checkOverflow('Usernamethshhd', 9),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorService.loadAndGetColor('textColor'),
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
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

              const Spacer(),
              GestureDetector(
                onTap: () {
                  //show snackbar with location
                  HelperFunctions.showSnackBar(context, 'Location of the post');
                },
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorService.loadAndGetColor(
                        'secondaryBackgroundColor'),
                    border: Border.all(
                        color: ColorService.loadAndGetColor('borderColor')),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Icon(
                            Icons.pin_drop_outlined,
                            size: 14,
                            color: ColorService.loadAndGetColor('iconColor'),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Flexible(
                            child: Text(
                              maxLines: 1,
                          checkOverflow('location', 5),
                          style: TextStyle(
                            color: ColorService.loadAndGetColor('textColor'),
                            fontSize: 12,
                          ),
                        )),
                      ]),
                ),
              ),
              //popup menu
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: ColorService.loadAndGetColor('iconColor'),
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
          const SizedBox(height: 10.0),

          //start of the post
          PostWidget(
              description:
                  'In this example, heightPercentage and widthPercentage represent the percentage of the screen height and width, respectively, that you want the container to occupy. The Container will then have a height and width based on these percentages.',
              images: List.empty(), isShared: false,),
          //end of the post
          Container(
              padding: const EdgeInsets.all(5),
              child: Row(
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
                          softWrap: true,
                          
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
                          color: ColorService.loadAndGetColor('secondaryTextColor'),
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
