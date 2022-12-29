import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class resultPage extends StatelessWidget {
  const resultPage({required this.message,required this.result,required this.resultStr});
  final String resultStr;
  final String result;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style:TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
            ),
            reusablewidget(
              color: inactiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      resultStr,
                      style:TextStyle(
                          fontSize: 20,
                          color: Colors.green
                      )
                  ),
                  Text(
                      result,
                      style:knumbertextStyle
                  ),
                  Text(
                      message,
                      textAlign: TextAlign.center,
                      style:TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                      )
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style: ktextLabelStyle,
                  ),
                ),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
              ),
            )
          ],
        )
    );
  }
}
