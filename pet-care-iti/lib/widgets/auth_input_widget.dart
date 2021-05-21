import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';

// ignore: must_be_immutable
class AuthInput extends StatelessWidget {
  TextEditingController controller;
  Widget suffixIcon;
  String hint;
  bool obscureText;
  String label;
  TextInputType inputType;
  int maxLines;

  AuthInput({
    @required this.controller,
    this.suffixIcon,
    this.hint,
    this.obscureText,
    this.label,
    this.inputType,
    this.maxLines,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText != null ? obscureText : false,
      controller: controller,
      keyboardType: inputType != null ? inputType : null,
      // minLines: 1,
      maxLines: maxLines != null ? maxLines : null,
      cursorColor: AppTheme.appDark,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
        fontFamily: 'Co',
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppTheme.appDark,
          width: 1.0,
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey[350],
          width: 1.0,
        )),
        suffixIcon: suffixIcon,
        hintText: hint != null ? hint : '',
        labelText: label != null ? label : '',
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontFamily: 'Co',
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontFamily: 'Co',
        ),
      ),
    );
  }
}
