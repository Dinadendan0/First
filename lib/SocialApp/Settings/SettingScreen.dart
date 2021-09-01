import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/SocialApp/Network/Cubit.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/component.dart';

class SettingsScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var userModel = SocialCubit.get(context).model;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 220,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          image : DecorationImage(
                            image: NetworkImage('${userModel.cover}'),
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 65,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:NetworkImage(
                          '${userModel.image}',

                        ),
                      ),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${userModel.name}',
                style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20),
              ),
              Text(
                '${userModel.bio} ',
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '26k',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Posts ',
                              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '400',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Photos ',
                              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '10k',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Followers ',
                              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '1500',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: (){},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultButton(
                      function: (){},
                      text: 'Edit your profile',
                      background: Colors.blue,
                      width:200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
