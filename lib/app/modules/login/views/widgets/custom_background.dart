import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {

  double heightApp;

  double heightInWeb;

  bool showMessage;

  CustomBackground(this.heightApp,
      this.heightInWeb,
      this.showMessage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: kIsWeb
              ? MediaQuery
              .of(context)
              .size
              .height * heightApp
              : MediaQuery
              .of(context)
              .size
              .height * heightInWeb,
        ),

        Center(
          child: Image.asset(
            'assets/images/ShortIcon.png',
            height: 170,
            width: 220,
          ),
        ),

        const Text(
          'Chameleon',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black87,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        showMessage ? Text(
          "Welcome To Our Application",
          style: TextStyle(
              fontSize: 14, color: Colors.grey),
        ) : Container(),
        // space
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
