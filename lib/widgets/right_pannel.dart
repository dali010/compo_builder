import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_styling.dart'; // Import the new widget

class RightPanel extends StatelessWidget {
  final WidgetType? selectedComponent;
  final int index;

  const RightPanel({super.key, required this.selectedComponent, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF14181B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2E3741).withOpacity(0.8),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          if (selectedComponent != null) ...[
            Text(
              'Component: ${selectedComponent!.value}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text('Text Settings', style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            TextStyling(
              initialValue: "Sample Text",
              componentIndex: index,
            ),
            const SizedBox(height: 20),
            // Other settings...
          ] else ...[
            const Text(
              'No component selected',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ]
        ],
      ),
    );
  }
}