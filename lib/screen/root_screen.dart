import 'dart:math';

import 'package:flutter/material.dart';
import 'package:must_have_chap10_random_dice/screen/home_screen.dart';
import 'package:must_have_chap10_random_dice/screen/settings_screen.dart';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
    shakeDetector = ShakeDetector.autoStart(
      // ➊ 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 100, // ➋ 감지 주기
      shakeThresholdGravity: threshold, // ➌ 감지 민감도
      onPhoneShake: onPhoneShake, // ➍ 감지 후 실행할 함수
    );
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: renderChildren(),
        ),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number),
      SettingsScreen(
          threshold: threshold, onThresholdChange: onThresholdChange),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.edgesensor_high_outlined), label: "주사위"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
      ],
      currentIndex: controller!.index,
      onTap: (value) {
        setState(() {
          controller!.animateTo(value);
        });
      },
    );
  }

  void tabListener() {
    setState(() {});
  }

  void onThresholdChange(double value) {
    setState(() {
      threshold = value;
    });
  }

  void onPhoneShake() {
    final rand = Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }
}
