part of 'story_details_cubit.dart';

abstract class StoryDetailsState extends Equatable {
  final String? error;
  final List<Comment>? comments;
  const StoryDetailsState({this.comments,this.error});
  @override
  List<Object> get props => [];
}

class StoryDetailsInitial extends StoryDetailsState {

  const StoryDetailsInitial();
}

class StoryDetailsLoading extends StoryDetailsState {

  const StoryDetailsLoading();
}
class StoryDetailsError extends StoryDetailsState {

  const StoryDetailsError(String error):super(error: error);
}


class StoryDetailsSuccess extends StoryDetailsState {

  const StoryDetailsSuccess(List<Comment> comments):super(comments: comments);
}


class StoryDetailsEmpty extends StoryDetailsState {

  const StoryDetailsEmpty();
}

