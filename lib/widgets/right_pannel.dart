import 'package:compo_builder/data/dropped_component.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/data/widgets_configurations.dart' as wg;
import 'package:flutter/material.dart';

import 'button_styling.dart'; // Import the new widget
import 'container_styling.dart'; // Import the new widget
import 'image_styling.dart'; // Import the new widget
import 'text_styling.dart'; // Import the new widget

class RightPanel extends StatefulWidget {
  final DroppedComponent? selectedComponent;
  final int index;

  const RightPanel(
      {super.key, required this.selectedComponent, required this.index});

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
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
          if (widget.selectedComponent != null) ...[
            Text(
              'Component: ${widget.selectedComponent!.type.value}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            _buildComponentSettings(widget.selectedComponent),
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

  Widget _buildComponentSettings(DroppedComponent? selectedComponent) {
    switch (selectedComponent?.type) {
      case WidgetType.text:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Text Settings',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            TextStyling(
              configuration:
                  (selectedComponent?.configuration as wg.TextConfiguration),
            ),
            const SizedBox(height: 20),
          ],
        );
      case WidgetType.image:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Image Settings',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            ImageStyling(
              configuration:
                  (selectedComponent!.configuration as wg.ImageConfiguration),
            ),
            const SizedBox(height: 20),
          ],
        );
      case WidgetType.container:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Container Settings',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            ContainerStyling(
              componentIndex: widget.index,
            ),
            const SizedBox(height: 20),
          ],
        );
      case WidgetType.button:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Button Settings',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            ButtonStyling(
              componentIndex: widget.index,
            ),
            const SizedBox(height: 20),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
