import 'package:chameleon/global/constants/constants.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {

  VoidCallback onTap;

  String text;

  MyTextButton(this.onTap,
      this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          //  margin: EdgeInsets.only(bottom: 120),
          width: 150,
          height: 50,
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            color: iconColor,
            borderRadius:
            BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
