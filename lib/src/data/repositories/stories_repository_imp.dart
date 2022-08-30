import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jumpapp/src/core/resources/data_state.dart';
import 'package:jumpapp/src/data/data_sources/remote/api_services.dart';
import 'package:jumpapp/src/domain/entities/comment.dart';
import 'package:jumpapp/src/domain/entities/story.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';


class StoriesRepositoryImp extends StoriesRepository {
  final ApiService _apiServices;

  StoriesRepositoryImp(this._apiServices);

  @override
  Future<DataState<List<Story>>> getTopStories() async {
    try {
      final httpResponse = await _apiServices.getTopStories();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        Iterable storyIds = httpResponse.data;
        var res = await Future.wait(storyIds.take(20).map((storyId) {
          return _getStoryById(storyId);
        }));
        return DataSuccess(res);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  Future<Story> _getStoryById(int storyId) async {
    var data = await _apiServices.getStoryById(storyId);

    return data.data;
  }

  @override
  Future<DataState<List<Comment>>> getStoryComments(List<int> commentsIds) async{
    try {
      var res = await Future.wait(commentsIds.take(20).map((commentId) {
        return _getCommentById(commentId);
      }));
      return DataSuccess(res);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  Future<Comment> _getCommentById(int commentId) async {
    var data = await _apiServices.getCommentById(commentId);
    return data.data;
  }
}
