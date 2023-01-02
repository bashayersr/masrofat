import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrofat/custom/constance.dart';

import 'custom_text.dart';

class CustomButtonSocial1 extends StatelessWidget {
  const CustomButtonSocial1({  required this.imageName, });

  final String imageName;


  @override
  Widget build(BuildContext context) {
    return Container(


        child: Column(
          children: [
            Image.asset(imageName),
            // SizedBox(
            //   height: 30,
            // ),
          ],
        ),
    );
  }
}