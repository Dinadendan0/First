import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  final int Result ;
  final bool isMale;
  final int age ;
  BmiResult({
    @required this.Result,
    @required this.isMale,
    @required this.age,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title:
    Text(
      'BMI Result',
    ),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale? 'male' : 'female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result : $Result',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
