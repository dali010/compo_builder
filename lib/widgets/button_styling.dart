// Button Styling...

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ButtonStyling extends StatefulWidget {
  final int componentIndex;

  const ButtonStyling({Key? key, required this.componentIndex}) : super(key: key);

  @override
  _ButtonStylingState createState() => _ButtonStylingState();
}

class _ButtonStylingState extends State<ButtonStyling> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Button Settings',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          'Button Text',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter button text',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Button Color',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter button color',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Button Text Color',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter button text color',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Button Size',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter button size',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),

          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
