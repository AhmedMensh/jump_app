import 'package:jumpapp/src/core/resources/data_state.dart';
import 'package:jumpapp/src/domain/entities/comment.dart';
import 'package:jumpapp/src/domain/entities/story.dart';

abstract class StoriesRepository {

  Future<DataState<List<Story>>> getTopStories();
  Future<DataState<List<Comment>>> getStoryComments(List<int> commentsIds);
}