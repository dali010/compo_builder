import 'package:compo_builder/data/widget_type.dart';
import 'package:flutter/material.dart';

class WidgetFactory {
  static Widget createWidget(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.text:
        return Text('Hello World');
      case WidgetType.button:
        return ElevatedButton(onPressed: () {}, child: Text('Click Me'));
      case WidgetType.image:
        return Image.network('https://example.com/image.png');
      case WidgetType.container:
        return Container(width: 100, height: 100, color: Colors.blue);
      default:
        return SizedBox.shrink();
    }
  }
}