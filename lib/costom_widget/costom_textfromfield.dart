import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nogod/static/all_colors.dart';

// ignore: must_be_immutable
class CostomTextField extends StatelessWidget {
  CostomTextField({
    super.key,
    required this.controller,
    this.validator,

    required this.errortext,
    this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.icon,
    this.onChanged,
    this.maxLength,
  });

  TextEditingController controller;

  var validator;

  String? errortext;
  var prefixIcon;
  var labelText;
  var suffixIcon;
  var icon;
  var onChanged;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      onChanged: onChanged,
      controller: controller,
       obscureText: !validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,

        labelText: labelText,
        labelStyle: TextStyle(color: AllColor.orangeColor),
        suffixIcon: suffixIcon,
         
      

        enabledBorder: const OutlineInputBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AllColor.orangeColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AllColor.orangeColor, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AllColor.orangeColor, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AllColor.orangeColor, width: 1),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errortext;
        }
        return null;
      },
    );
  }
}
