part of 'stories_cubit.dart';

abstract class StoriesState extends Equatable {
  final String? error;
  final List<Story>? stories;
  const StoriesState({this.error,this.stories});
  @override
  List<Object?> get props => [stories,error];
}

class StoriesInitial extends StoriesState {
  const StoriesInitial();
}


class StoriesLoading extends StoriesState {
  const StoriesLoading();
}

class StoriesEmpty extends StoriesState {
  const StoriesEmpty();
}

class StoriesError extends StoriesState {
  const StoriesError(String error) :super(error: error);
}


class StoriesSuccess extends StoriesState {
  const StoriesSuccess(List<Story> stories) :super(stories: stories);
}
