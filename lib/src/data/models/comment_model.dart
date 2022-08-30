import 'package:jumpapp/src/data/models/story_model.dart';
import 'package:jumpapp/src/domain/entities/comment.dart';

class CommentModel extends Comment {
  String? text;
  int? commentId;
  StoryModel? story;

  CommentModel({this.commentId, this.text, this.story})
      : super(text: text, commentId: commentId, commentStory: story);

  CommentModel.fromJson(dynamic json) {
    commentId = json['id'];
    text = json['text'];
  }
}
