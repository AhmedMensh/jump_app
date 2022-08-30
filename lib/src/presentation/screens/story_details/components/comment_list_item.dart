import 'package:flutter/material.dart';
import 'package:jumpapp/src/domain/entities/comment.dart';
import 'package:jumpapp/src/presentation/screens/story_details/story_details_screen.dart';

import '../../../../domain/entities/story.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({required this.comment, Key? key}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${comment.text}'),
          const SizedBox(height: 5,),
          Text('By: ${comment.by}'),
          const SizedBox(height: 5,),
          Text('Date: ${DateTime.fromMillisecondsSinceEpoch(
              comment.time ?? 0)}'),
        ],
      ),
    );
  }
}
