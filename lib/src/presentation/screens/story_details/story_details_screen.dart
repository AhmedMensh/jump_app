import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/domain/entities/story.dart';
import 'package:jumpapp/src/presentation/screens/story_details/bloc/story_details_cubit.dart';
import 'package:jumpapp/src/presentation/screens/story_details/components/comment_list_item.dart';

class StoryDetailsScreen extends StatefulWidget {
  const StoryDetailsScreen({required this.story,Key? key}) : super(key: key);

  final Story story;
  static const String routeName = 'story-details';

  @override
  State<StoryDetailsScreen> createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {

  late StoryDetailsCubit _storyDetailsCubit;
  @override
  void initState() {
    _storyDetailsCubit = BlocProvider.of<StoryDetailsCubit>(context);
    _storyDetailsCubit.getStoryComments(widget.story.kids ?? []);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.story.title ??''),centerTitle: true,),
      body: Container(
        margin: EdgeInsets.only(top: 20,left: 10),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.story.title??''),
          Text('By: ${widget.story.by}'),
          Expanded(
            child: BlocBuilder<StoryDetailsCubit, StoryDetailsState>(
              builder: (_, state) {
                if (state is StoryDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is StoryDetailsError) {
                  return Center(
                    child: Text('${state.error}'),
                  );
                }
                if (state is StoryDetailsEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
                if (state is StoryDetailsSuccess) {
                  return Container(
                    height: 150,
                    child: ListView.builder(
                        itemCount: state.comments?.length,
                        itemBuilder: (context, index) {
                          return CommentListItem(
                            comment: state.comments![index],
                          );
                        }),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    ),);
  }
}
