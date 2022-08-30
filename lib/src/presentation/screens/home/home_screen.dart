import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpapp/src/presentation/screens/home/bloc/stories_cubit.dart';
import 'package:jumpapp/src/presentation/screens/home/components/story_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late StoriesCubit _storiesCubit;
  @override
  void initState() {

    _storiesCubit = BlocProvider.of<StoriesCubit>(context);
    _storiesCubit.getTopStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF4F4F4),
      appBar: AppBar(title: const Text('Top Stories'),centerTitle: true,),
      body: BlocBuilder<StoriesCubit,StoriesState>(builder:(_,state){
        if(state is StoriesLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is StoriesError){
          return Center(child: Text('${state.error}'),);
        }
        if(state is StoriesEmpty){
          return const Center(child: Text('No data available'),);
        }
        if(state is StoriesSuccess){
          return ListView.builder(
            // controller: ,
              itemCount: state.stories?.length,
              itemBuilder: (context,index){
            return StoryListItem(story: state.stories![index] ,);
          });
        }
        return const SizedBox();
      },),
    );
  }
}
