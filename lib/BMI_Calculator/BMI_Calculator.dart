import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/BMI_Calculator/BMI_result_screen.dart';
class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true ;
  double height = 120;
  int weight = 10;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
            'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true ;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/male.png'
                              ),
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isMale? Colors.blue : Colors.black54,
                        ),
                        ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false ;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/female.png'),
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: !isMale? Colors.blue : Colors.black54,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value:height,
                      max: 200,
                      min:80 ,
                      onChanged:(value){
                       setState(() {
                         height = value ;
                       });
                      },
                    ),
                      ],
                ),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
               children: [
                 Expanded(
                   child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Age',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Text(
                           '${age}',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   age--;
                                 });
                               },
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                     decoration: BoxDecoration(
                         borderRadius:BorderRadius.circular(15),
                         color: Colors.black54,
                     ),



                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Expanded(
                   child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'weight',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Text(
                           '${weight}',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                     decoration: BoxDecoration(
                       borderRadius:BorderRadius.circular(15),
                       color: Colors.black54,
                     ),
                   ),
                 ),
               ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(onPressed: (){
              double result = weight/ pow(height/100, 2);
              print (result.round());
              Navigator.push(
                  context, MaterialPageRoute(
                  builder:(context )=> BmiResult(
                    age: age ,
                    isMale: isMale ,
                    Result: result.round(),
                  ),
              ),
              );
            },
              height: 50,
              color: Colors.blue,
            child: 
              Text('Calculate',
                style:
                TextStyle(
                    color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
         ],
      ),
    );
  }
}
