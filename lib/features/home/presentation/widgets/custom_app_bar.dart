import 'package:chefly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        "Let’s Cooking",
        style: Styles.textStyle24.copyWith(
          color: Color(0xff535353),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
