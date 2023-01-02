import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({ required this.text, required this.hint,
    // required this.onSave,
    // required this.validator
  }) ;
 final String text;
 final String hint;
 // final Function onSave;
 // final Function validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CustomText(
          text:text,
          fontSize:14 ,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.grey
              ),
              fillColor: Colors.white
          ) ,
          // onSaved: onSave,
          // validator: validator,
        ),

      ],),
    );
  }
}
