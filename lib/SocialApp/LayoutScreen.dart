

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/SocialApp/Feeds/PostScreen.dart';
import 'package:untitled/SocialApp/Network/Cubit.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/component.dart';
import 'package:untitled/icon_broken.dart';

class SocialLayout extends StatelessWidget
{
  var formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          key: formkey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.notifications_sharp,),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.search_rounded,),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_outlined,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),

            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
                Icons.edit,
            ),
            onPressed: ()
            {
              showModalBottomSheet(
                context: context,
                builder: (context) => postScreen(),
                );

            }

          ),
        );
      },
    );
  }
}
