import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/News_App/Network/Cubit_NewsApp.dart';
import 'package:untitled/News_App/Network/Status_NewsApp.dart';
import 'package:untitled/News_App/Search_screen.dart';
import 'package:untitled/TODO_App/App_cubit.dart';
import 'package:untitled/component.dart';


class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context, state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              ' News App'
            ),
            actions: [
              IconButton(
                  onPressed:()
                {
                  navigateTo(context ,SearchScreen(),);
                },
                  icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed:()
                {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                    Icons.brightness_3_sharp,
                ),
              ),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),
        ) ;
      },
    );
  }
}
