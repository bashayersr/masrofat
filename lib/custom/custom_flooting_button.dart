import 'package:flutter/material.dart';
import 'package:masrofat/custom/constance.dart';
import 'package:masrofat/custom/custom_text.dart';

class FlootingButton extends StatelessWidget {
  const FlootingButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: FloatingActionButtonLocation.endFloat,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: primaryColor,

      onPressed: () {},
      // onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Icon(Icons.add),
        color: primaryColor,
      ),
      elevation: 4.0,
    );
  }
}
