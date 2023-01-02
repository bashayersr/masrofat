
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constance.dart';
import 'custom_text.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text ;
  final Function onPressed ;


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(18),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: primaryColor,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: (){
      },
      // onPressed,
      child:  CustomText(
        text:text,

        color: Colors.white,
        alignment: Alignment.bottomCenter,
      ),
    );


  }
}
