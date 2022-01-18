import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app_2/constants/colors.dart';
import 'package:timer_app_2/widgets/count_down_widget.dart';
import '../widgets/circular_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration _countDown = const Duration(seconds: 0);
  bool _isTimerActive = false;
  int totalTime = 60, currentTime = 60;
  late Timer timer;

  void startCountDown() {
    totalTime = _countDown.inSeconds;
    currentTime = _countDown.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        currentTime -= 1;
      });
      if (currentTime < 1) stopCountDown();
    });
  }

  void stopCountDown() {
    timer.cancel();
    setState(() {
      _isTimerActive = false;
    });
  }

  void pauseCountDown() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            !_isTimerActive
                ? SizedBox(
                    height: size.width - 20,
                    child: CupertinoTimerPicker(
                      initialTimerDuration: const Duration(seconds: 1),
                      onTimerDurationChanged: (dur) {
                        _countDown = dur;
                      },
                      mode: CupertinoTimerPickerMode.hms,
                    ),
                  )
                : CountDownIndicatorWidget(
                    currentTime: currentTime,
                    totalTime: _countDown.inSeconds,
                  ),
            _buildButtonRow(context),
            const SizedBox(height: 25),
            _buildAlarmSelectorBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularButton(
          bgColor: greyButtonBgColor,
          txtColor: greyTxtBtnColor,
          title: 'Cancel',
          onTap: () {
            setState(() {
              _isTimerActive = false;
            });
          },
        ),
        CircularButton(
          bgColor: greenActiveBtnColor,
          txtColor: greenActiveTxtColor,
          title: 'Start',
          onTap: () {
            setState(() {
              _isTimerActive = true;
            });
            startCountDown();
          },
        ),
      ],
    );
  }

  Widget _buildAlarmSelectorBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: greyButtonBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: const [
          Expanded(child: Text('When Timer ends')),
          Text(
            'Radar',
            style: TextStyle(color: greyTxtBtnColor),
          ),
          Icon(
            Icons.chevron_right,
            color: greyTxtBtnColor,
          ),
        ],
      ),
    );
  }
}
