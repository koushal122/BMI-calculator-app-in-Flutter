import 'package:flutter/material.dart';

class reusablewidget extends StatelessWidget {
  const reusablewidget({this.childWidget,this.color});
  final childWidget;
  final color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: color
        ),
      ),
    );;
  }
}
