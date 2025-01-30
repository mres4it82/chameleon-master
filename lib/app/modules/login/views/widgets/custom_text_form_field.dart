import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  FocusNode focusNode;

  VoidCallback onEditingComplete;

  VoidCallback suffixIconInkWell;

  TextEditingController controller;

  String validator;

  String hintText;

  String obscuringCharacter;

  bool obscureText;

  Color color;

  IconData iconData;

  TextInputType type;

  CustomTextField(
    this.focusNode,
    this.onEditingComplete,
    this.suffixIconInkWell,
    this.controller,
    this.validator,
    this.hintText,
    this.iconData,
    this.color,
    this.obscureText,
    this.type,
    this.obscuringCharacter,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: type,
      onEditingComplete: onEditingComplete,
      style: const TextStyle(fontSize: 12),
      obscuringCharacter: obscuringCharacter,
      cursorColor: Colors.black,
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return validator;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,

        fillColor: Colors.grey.shade200,
        suffixIcon: InkWell(
          onTap: suffixIconInkWell,
          child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border:
                  Border.all(color: Colors.grey)),

              child: Icon(
                iconData,
                color: color,
                size: 20,
              )),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 12, color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200, width: 1)),
      ),
    );
  }
}
