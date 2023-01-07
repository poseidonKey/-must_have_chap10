import 'package:flutter/material.dart';
import 'package:must_have_chap10_random_dice/const/colors.dart';
import 'package:must_have_chap10_random_dice/screen/root_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          sliderTheme: SliderThemeData(
              thumbColor: primaryColor,
              activeTickMarkColor: primaryColor,
              inactiveTrackColor: primaryColor.withOpacity(.3)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
              unselectedItemColor: secondaryColor,
              backgroundColor: backgroundColor)),
      title: 'Material App',
      home: const RootScreen(),
    );
  }
}
