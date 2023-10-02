import 'package:flutter/material.dart';
import 'package:nogod/static/all_colors.dart';

// ignore: must_be_immutable
class CostomHomeCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onTap;
  // ignore: prefer_typing_uninitialized_variables
  var icon;
  // ignore: prefer_typing_uninitialized_variables
  var text;
  CostomHomeCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 75,
          width: 75,
          child: InkWell(
            onTap: onTap,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: AllColor.orangeColor,
              child: icon,
            ),
          ),
        ),
        text,
      ],
    );
  }
}
