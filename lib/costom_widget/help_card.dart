import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomHelpCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onTap;
  // ignore: prefer_typing_uninitialized_variables
  var icon;
  // ignore: prefer_typing_uninitialized_variables
  var text;
  CostomHelpCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          text
        ],
      ),
    );
  }
}