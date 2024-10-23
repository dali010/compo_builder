enum WidgetType { text, button, image, container }

extension WidgetTypeValueExtension on WidgetType {
  String get value => capitalizeFirst(name);

  String capitalizeFirst(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
