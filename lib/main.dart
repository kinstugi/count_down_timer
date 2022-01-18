import 'package:flutter/material.dart';
import 'package:timer_app_2/constants/colors.dart';
import 'package:timer_app_2/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: scaffoldBgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
