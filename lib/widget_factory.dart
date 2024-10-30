import 'package:cached_network_image/cached_network_image.dart';
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
        return CachedNetworkImage(
          imageUrl:
              '',
          placeholder: (context, url) => const SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xFF023047)),
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );

      case WidgetType.container:
        return Container(width: 35, height: 35, color: Colors.white);
      default:
        return const SizedBox.shrink();
    }
  }
}
