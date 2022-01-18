import 'package:flutter/material.dart';
import 'package:timer_app_2/constants/colors.dart';

class CountDownIndicatorWidget extends StatelessWidget {
  final int totalTime;
  final int currentTime;

  const CountDownIndicatorWidget({
    Key? key,
    this.currentTime = 45,
    this.totalTime = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width,
        height: size.width - 20,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Text(
                '$currentTime',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            CircularProgressIndicator(
              value: currentTime / totalTime,
              backgroundColor: greyButtonBgColor,
              strokeWidth: 7,
              valueColor: const AlwaysStoppedAnimation(goldBgColor),
            )
          ],
        ),
      ),
    );
  }
}
