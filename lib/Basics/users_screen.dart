import 'package:flutter/material.dart';
class UserModel {
  final int id ;
  final String name;
  final String phone;
  UserModel({
    @required this.id,
    @required this.name,
    @required this.phone,
});
}
class UsersScreen extends StatelessWidget {
  List<UserModel> users=[
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
    UserModel(
      id: 5,
      name: 'dina dendan' ,
      phone: '01097952726',

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:
      ListView.separated(
        itemBuilder:(context,index ) =>buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
        itemCount:users.length,

      ),
    );
  }
  Widget buildUserItem(UserModel user)=> Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child:
          Text(
           '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
