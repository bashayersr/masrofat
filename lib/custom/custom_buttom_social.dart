
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({ required this.text, required this.imageName, required this.onPress});
  final String text;
  final String imageName;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: Colors.grey.shade100,
        ),
        child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(18),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.white,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: () {},
          // onPressed,
          child: Row(

            children: [
              Image.asset(imageName),
              SizedBox(
                width: 30,
              ),

              CustomText(
                text: text,
                color: Colors.black,
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),

    );
  }
}
