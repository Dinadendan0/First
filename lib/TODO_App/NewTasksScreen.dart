import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/TODO_App/App_cubit.dart';
import 'package:untitled/TODO_App/App_states.dart';
import 'package:untitled/component.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(
          tasks : tasks,
        );
      },
    );
  }
}
