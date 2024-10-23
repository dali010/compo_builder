import 'package:flutter/material.dart';

class SmallScreenWarning extends StatelessWidget {
  const SmallScreenWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF303030),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/small_screen_bg.png',
          ),
          const SizedBox(height: 20),
          const Text(
            "Window too small",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            "You're signed in! But it seems the window for FlutterFlow is too small or zoomed in.",
            style: TextStyle(color: Color(0xFF9AA6B6)),
          ),
        ],
      ),
    );
  }
}
