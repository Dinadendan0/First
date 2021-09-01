import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/News_App/Network/Cubit_NewsApp.dart';
import 'package:untitled/News_App/Network/Status_NewsApp.dart';
import 'package:untitled/component.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).sports ;
        return articleBuilder(list,context);
      },
    );

  }
}
