import 'package:compo_builder/data/widget_type.dart';
import 'package:flutter/material.dart';

class WidgetFactory {
  static Widget createWidget(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.text:
        return Text('Hello World');
      case WidgetType.button:
        return AbsorbPointer(
          child: TextButton(
            onPressed: () {},
            child: Text('Click Me'),
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                shape: WidgetStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(),
                )),
          ),
        );
      case WidgetType.image:
        return Image.network('https://example.com/image.png');
      case WidgetType.container:
        return Container(width: 100, height: 100, color: Colors.white);
      default:
        return SizedBox.shrink();
    }
  }
}
