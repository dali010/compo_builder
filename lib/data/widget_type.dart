import 'package:flutter/material.dart';

// Defining an enum for different widget types
enum WidgetType { text, button, image, container }

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
