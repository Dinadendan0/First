import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/Cache_helper.dart';
import 'package:untitled/Shop_App/LoginScreen.dart';
import 'package:untitled/component.dart';
class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,

});
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();

  List <BoardingModel> boarding =
  [
    BoardingModel(
      image: 'assets/Images/photo1.jpg',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/Images/photo2.jpg',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/Images/photo3.jpg',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),

  ];

  bool isLast = false;

  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if(value)
        {
          navigateAndFinish(context, LoginScreen());
        }
    });

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            function: submit,
              text:'SKIP',
              //style: TextStyle(
                //color: Colors.deepOrange,
              ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  if (index ==boarding.length -1)
                  {
                    setState(() {
                      isLast =true;
                    });
                  } else
                    {
                      setState(() {
                        isLast = false;
                      });
                    }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context ,index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      expansionFactor: 4,
                      spacing: 5 ,
                      dotWidth: 10,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                    ),
                    count: boarding.length,

                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if (isLast)
                      {
                        submit();
                      } else
                        {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }

                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24,

        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14,

        ),
      ),
      SizedBox(
        height: 70,
      ),



    ],
  );
}
