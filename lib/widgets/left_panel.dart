import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/component.dart';

class LeftPanel extends StatelessWidget {
  final List<Component> components;

  const LeftPanel({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100, // Controls the max width of items
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1, // Controls the height relative to the width
      ),
      itemCount: components.length,
      itemBuilder: (context, index) {
        return Draggable<String>(
          data: components[index].title,
          feedback: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF14181B),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF2E3741).withOpacity(0.8),
                width: 1.2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  components[index].iconAsset,
                  width: 37,
                  height: 37,
                  colorFilter:
                  const ColorFilter.mode(Color(0xFF8E8E93), BlendMode.srcIn),
                ),
                const SizedBox(height: 5),
                DefaultTextStyle(
                  style: const TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  child: Text(
                    components[index].title,
                  ),
                )
              ],
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF2E3741).withOpacity(0.8),
                width: 1.2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  components[index].iconAsset,
                  width: 37,
                  height: 37,
                  colorFilter:
                      const ColorFilter.mode(Color(0xFF8E8E93), BlendMode.srcIn),
                ),
                const SizedBox(height: 5),
                Text(
                  components[index].title,
                  style: const TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
