import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String? label, hint, labelText;

  final bool? isActive;
  final TextInputType? type;
  final int? maxLines;
  final int? minLines;
  final double? radius;
  final bool readOnly;

  final TextAlign textAlign;
  final onChanged;
  final submitted;
  final controller;
  final color;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.labelText,
    this.hint = '',
    this.type,
    this.radius = 3,
    this.readOnly = false,
    this.textAlign = TextAlign.center,
    this.isActive = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.submitted,
    this.controller,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        readOnly: readOnly,
        cursorColor: Colors.black,
        keyboardType: type,
        enabled: isActive,
        minLines: minLines,
        maxLines: maxLines,
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(fontSize: 14, ),
        decoration: InputDecoration(


          contentPadding: kIsWeb ?
          EdgeInsets.symmetric(vertical: 40)
              : EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          labelText: labelText ?? '',
          label: label == null ? null : Text(label!),
          filled: true,
          fillColor: color ?? Colors.transparent,
          hintText: hint,

          hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              borderSide: BorderSide(
                color:Colors.black38,
              )
          ),

        ),

        textAlign: textAlign,

        onFieldSubmitted: submitted,
      ),
    );
  }
}
