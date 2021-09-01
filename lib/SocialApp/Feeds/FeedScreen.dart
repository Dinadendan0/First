import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(8),
            elevation: 10,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image(
                  image: NetworkImage('https://i.pinimg.com/564x/5f/ae/b2/5faeb205dead60b7a59bdee197dd4b55.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'You can communicate ',
                      style: Theme.of(context).textTheme.overline,
                ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'With your friends ',
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Now',
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.separated(
            itemBuilder: (context, index) =>buildPostItem(context) ,
            separatorBuilder: (context,index) => SizedBox(
              height: 10,
            ),
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
  Widget buildPostItem (context) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.symmetric(horizontal: 8),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/59/7c/d6/597cd607e4168afc21e9602e5521b88c.jpg',

                ),

              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dina Dendan',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color:Colors.blue ,
                          size: 18,
                        ),
                      ],
                    ),
                    Text(
                      'May 21,2020 at 11:00 pm',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          Column(
            children:
            [
              Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here  making it look like readable English.',
                style: Theme.of(context).textTheme.subtitle1,

              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top:5,
                ),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children:
                    [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 10),
                        child: Container(
                          height: 20,
                          child: MaterialButton(
                            onPressed: (){},
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#software',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 10),
                        child: Container(
                          height: 20,
                          child: MaterialButton(
                            onPressed: (){},
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#software',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 10),
                        child: Container(
                          height: 20,
                          child: MaterialButton(
                            onPressed: (){},
                            minWidth: 1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#software',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/564x/92/3d/b5/923db567e321e03f2eaa7246ace030c2.jpg'),
                      fit: BoxFit.cover,
                    )

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border_sharp,
                                size: 17,
                                color: Colors.grey[600],

                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1200',
                              ),
                            ],
                          ),
                        ),
                        onTap:(){},

                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.mode_comment_outlined,
                                size: 17,
                                color: Colors.grey[600],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1200',
                              ),
                            ],
                          ),
                        ),
                        onTap:(){},
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                'https://i.pinimg.com/564x/59/7c/d6/597cd607e4168afc21e9602e5521b88c.jpg',
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'write a comment ...',

                          ),
                        ],
                      ),
                      onTap: (){},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border_sharp,
                          size: 17,
                          color: Colors.grey[600],

                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                        ),
                      ],
                    ),
                    onTap:(){},

                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    ),
  );

}
