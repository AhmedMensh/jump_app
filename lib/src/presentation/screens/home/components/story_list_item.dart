import 'package:flutter/material.dart';

import '../../../../domain/entities/story.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({required this.story,Key? key}) : super(key: key);

  final Story story;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${story.title}'),
          const SizedBox(height: 5,),
          Text('By: ${story.by}'),
          const SizedBox(height: 5,),
          Text('Date: ${DateTime.fromMillisecondsSinceEpoch(story.time ?? 0)}'),
        ],
      ),
    );
  }
}
