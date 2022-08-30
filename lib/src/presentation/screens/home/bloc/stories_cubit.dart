import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jumpapp/src/core/resources/data_state.dart';
import 'package:jumpapp/src/domain/entities/story.dart';
import 'package:jumpapp/src/domain/repositories/stories_repository.dart';

part 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  final StoriesRepository _storiesRepository;

  StoriesCubit(this._storiesRepository) : super(const StoriesInitial());

  Future<void> getTopStories() async {
    emit(const StoriesLoading());
    final dataState = await _storiesRepository.getTopStories();

    if (dataState is DataSuccess) {
      final stories = dataState.data;

      if (stories == null || stories.isEmpty) {
        emit(const StoriesEmpty());
      } else {
        emit(StoriesSuccess(stories));
      }
    }

    if (dataState is DataFailed) {
      emit(StoriesError(dataState.error?.message ?? ""));
    }
  }
}
