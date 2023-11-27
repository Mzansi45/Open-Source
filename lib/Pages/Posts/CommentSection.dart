import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: CommentTreeWidget<Comment, Comment>(
        Comment(
            avatar: 'https://random.imagecdn.app/150/150',
            userName: 'Mzansi45',
            content:
                'A Dart template generator wh A Dart template genera'),
        [
          Comment(
            avatar: 'https://random.imagecdn.app/150/150',
            userName: 'Person 1',
            content: 'A Dart \ntemplate \ngenerator \nwhich \nhelps \nteams',
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
        treeThemeData:
            const TreeThemeData(lineColor: Colors.orange, lineWidth: 2),
        avatarRoot: (context, data) => PreferredSize(
          preferredSize: const Size.fromRadius(18),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                data.avatar ?? 'https://random.imagecdn.app/150/150'),
          ),
        ),
        avatarChild: (context, data) => PreferredSize(
          preferredSize: const Size.fromRadius(12),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                data.avatar ?? 'https://random.imagecdn.app/150/150'),
          ),
        ),
        contentChild: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userName!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ReadMoreText(
                      '${data.content}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                      trimLines: 4,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '   Show more',
                      trimExpandedText: '   Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Like');
                        },
                        child: const Row(children: [
                          Icon(Icons.favorite_border_outlined, size: 18),
                          SizedBox(width: 5),
                          Text('33'),
                        ]),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Reply');
                        },
                        child: const Row(children: [
                          Icon(Icons.reply, size: 18),
                          SizedBox(width: 5),
                          Text('86'),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userName!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ReadMoreText(
                      '${data.content}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                      trimLines: 4,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '   Show more',
                      trimExpandedText: '   Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Like');
                        },
                        child: const Row(children: [
                          Icon(Icons.favorite_border_outlined, size: 18),
                          SizedBox(width: 5),
                          Text('33'),
                        ]),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Reply');
                        },
                        child: const Row(children: [
                          Icon(Icons.reply, size: 18),
                          SizedBox(width: 5),
                          Text('86'),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
