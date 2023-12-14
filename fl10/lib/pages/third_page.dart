import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'animation_lo71zg00.json', // Путь к файлу анимации в папке assets
              width: 200,
              height: 200,
            ),
            Text(
              "Page Number 3",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}