import 'package:flutter/material.dart';
class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation:0.0,
      titleSpacing: 20,
      title:
      Row(
        children: [
          CircleAvatar(
            radius: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Text('Chats',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
      actions: [
        IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.white,
            ),
          ),
          onPressed: (){},
        ),
        IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: 20,
              color: Colors.white,
            ),
          ),
          onPressed: (){},
        ),
      ],
    ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[350],
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(Icons.search,
                    ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder:(context, index)=> SizedBox( width: 15,),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,index)=>buildChatIem() ,
                  separatorBuilder:(context,index)=>SizedBox(
                    height: 10,
                  ),
                  itemCount:10,
              ),
      ],
    ),
        ),
    ),
    );
  }
  Widget buildStoryItem() => Row(
    children: [
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Dina Dendan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
            ),

          ],
        ),
      ),
      SizedBox(
        width: 7,
      ),
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Dina Dendan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
            ),

          ],
        ),
      ),
      SizedBox(
        width: 7,
      ),
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Dina Dendan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
            ),

          ],
        ),
      ),
      SizedBox(
        width: 7,
      ),
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Dina Dendan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
            ),

          ],
        ),
      ),
      SizedBox(
        width: 7,
      ),
      Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Dina Dendan',
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
            ),

          ],
        ),
      ),
    ],
  );
  Widget buildChatIem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
          ),
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dina Dendan',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '3amlaaa eh ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}