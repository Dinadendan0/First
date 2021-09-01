import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: Icon(Icons.menu,),
        title: Text('Khaled Store '),
        actions: [
          IconButton(icon:Icon(Icons.notifications_active),
              onPressed: () {
                print('notification click');
              }
          ),
          IconButton(icon: Icon(Icons.search),
              onPressed: () {
                print('search click');
              }
          ) ,
          IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: (){
                print('button click');
              }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Dinaaaaa', style: TextStyle(
              fontSize:50,
              color: Colors.black,
              backgroundColor: Colors.red,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
