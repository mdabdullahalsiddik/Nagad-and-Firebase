import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomBottomIcon extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onPressed;
  // ignore: prefer_typing_uninitialized_variables
  var icon;
  // ignore: prefer_typing_uninitialized_variables
  var text;
  CostomBottomIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onPressed, icon: icon),
       text
      ],
    );
  }
}
