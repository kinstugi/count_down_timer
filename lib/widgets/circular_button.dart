import 'package:flutter/material.dart';
import 'package:timer_app_2/constants/colors.dart';

class CircularButton extends StatelessWidget {
  final Color bgColor;
  final Color txtColor;
  final String title;
  final VoidCallback onTap;

  const CircularButton({
    Key? key,
    required this.bgColor,
    required this.txtColor,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bgColor,
        ),
        child: Center(
          child: Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: scaffoldBgColor, width: 2),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
