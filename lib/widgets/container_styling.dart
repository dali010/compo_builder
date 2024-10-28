// Container styling...
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ContainerStyling extends StatefulWidget {
  final int componentIndex;

  const ContainerStyling({Key? key, required this.componentIndex}) : super(key: key);

  @override
  _ContainerStylingState createState() => _ContainerStylingState();
}

class _ContainerStylingState extends State<ContainerStyling> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Container Settings',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          'Container Width',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter container width',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Container Height',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter container height',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Container Color',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter container color',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Border Radius',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder
              : 'Enter border radius',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Border Width',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          padding: const EdgeInsets.all(10),
          placeholder: 'Enter border width',
          placeholderStyle: const TextStyle(color: Colors.white),
          style: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
    ],
    );
  }
}