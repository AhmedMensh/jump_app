import 'package:dio/dio.dart';
import 'package:jumpapp/src/core/constants.dart';
import 'package:jumpapp/src/data/models/comment_model.dart';
import 'package:jumpapp/src/data/models/story_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/topstories.json?print=pretty')
  Future<HttpResponse<List<int>>> getTopStories();

  @GET('/item/{storyId}.json?print=pretty')
  Future<HttpResponse<StoryModel>> getStoryById(@Path("storyId") int storyId);
  @GET('/item/{commentId}.json?print=pretty')
  Future<HttpResponse<CommentModel>> getCommentById(@Path("commentId") int storyId);
}
