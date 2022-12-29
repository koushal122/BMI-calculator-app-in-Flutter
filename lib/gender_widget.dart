import 'package:flutter/material.dart';

class genderWidget extends StatelessWidget {
  const genderWidget({this.icon,this.text});
  final icon;
  final text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10,
        ),
        text
      ],
    );
  }
}