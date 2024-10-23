import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallScreenWarning extends StatelessWidget {
  const SmallScreenWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [SvgPicture.asset('assets/icons/small_screen.svg')],
    );
  }
}
