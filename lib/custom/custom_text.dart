import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrofat/custom/constance.dart';


class CustomText extends StatelessWidget {

final String text ;
  final double fontSize ;
  final Color color ;
  final Alignment alignment;

CustomText({
  this.text="",
  this.color=primaryColor1,
  this.fontSize=16,
  this.alignment=Alignment.topLeft
});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
        style: TextStyle(
        color: color,
        fontSize: fontSize,


    ),
    )
    );
  }
}
