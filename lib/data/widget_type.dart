import 'package:flutter/material.dart';

// Defining an enum for different widget types
enum WidgetType { text, button, image, container }

// Adding properties for WidgetType with default values and a copyWith method
class CustomWidget {
  final WidgetType type;
  final String text;
  final Color color;
  final Size size;

  CustomWidget({
    required this.type,
    this.text = '',
    this.color = Colors.black,
    this.size = const Size(100, 100),
  });

  // Method to update specific properties of a CustomWidget (similar to immutable objects)
  CustomWidget copyWith({String? text, Color? color, Size? size}) {
    return CustomWidget(
      type: this.type,
      text: text ?? this.text,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
}

// Extension to get the formatted name of WidgetType
extension WidgetTypeValueExtension on WidgetType {
  String get value => capitalizeFirst(name);

  String capitalizeFirst(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
