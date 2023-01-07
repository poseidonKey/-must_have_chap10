import 'package:flutter/material.dart';
import 'package:must_have_chap10_random_dice/const/colors.dart';

class HomeScreen extends StatelessWidget {
  final int number;
  const HomeScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/img/$number.png"),
            const Text(
              "행운의 숫자",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              number.toString(),
              style: const TextStyle(
                  fontSize: 60,
                  color: primaryColor,
                  fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}
