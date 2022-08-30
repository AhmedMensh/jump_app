import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jumpapp/src/core/resources/data_state.dart';
import 'package:jumpapp/src/domain/entities/comment.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';

part 'story_details_state.dart';

class StoryDetailsCubit extends Cubit<StoryDetailsState> {

  final StoriesRepository _storiesRepository;
  StoryDetailsCubit(this._storiesRepository) : super(const StoryDetailsInitial());

  Future<void> getStoryComments(List<int> commentsIds) async {
    emit(const StoryDetailsLoading());
    final dataState = await _storiesRepository.getStoryComments(commentsIds);

    if (dataState is DataSuccess) {
      final comments = dataState.data;

      if (comments == null || comments.isEmpty) {
        emit(const StoryDetailsEmpty());
      } else {
        emit(StoryDetailsSuccess(comments));
      }
    }

    if (dataState is DataFailed) {
      emit(StoryDetailsError(dataState.error?.message ?? ""));
    }
  }
}
