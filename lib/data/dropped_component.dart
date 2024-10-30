import 'package:cached_network_image/cached_network_image.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/data/widgets_configurations.dart' as wg;
import 'package:compo_builder/widgets/text_styling.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../widget_factory.dart';

class DroppedComponent extends Equatable {
  final String id;
  final WidgetType type;
  final bool isSelected;
  final Widget widget;
  final wg.CustomConfiguration configuration;

  // Create an instance of Uuid to generate unique IDs
  static const Uuid _uuid = Uuid();

  DroppedComponent({
    required this.type,
    this.isSelected = true,
    Widget? widget,
    wg.CustomConfiguration? configuration,
  })  : id = _uuid.v4(),
        configuration =
            configuration ?? wg.CustomConfiguration.createConfiguration(type),
        widget = widget ?? WidgetFactory.createWidget(type);

  DroppedComponent copyWith({
    WidgetType? type,
    bool? isSelected,
    Widget? widget,
    wg.CustomConfiguration? configuration,
  }) {
    return DroppedComponent(
        type: type ?? this.type,
        isSelected: isSelected ?? this.isSelected,
        widget: widget ?? (((this.type == WidgetType.text) &&
                (configuration is wg.TextConfiguration))
            ? Text(
                configuration.text,
                textAlign: configuration.textAlign,
                maxLines: configuration.maxLines,
                style: TextStyle(
                  color: configuration.color,
                  fontWeight: configuration.fontWeight,
                  fontSize: configuration.fontSize,
                  decoration: configuration.fontStyle == FontStyles.underline
                      ? TextDecoration.underline
                      : configuration.fontStyle == FontStyles.lineThrough
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  fontStyle: configuration.fontStyle == FontStyles.italic
                      ? FontStyle.italic
                      : FontStyle.normal,
                  height: configuration.lineHeight,
                  letterSpacing: configuration.letterSpacing,
                ),
              )
            : (this.type == WidgetType.image &&
                    configuration is wg.ImageConfiguration)
                ? Opacity(
                    opacity: configuration.opacity,
                    child: ClipRRect(
                      borderRadius:
                          configuration.borderRadius ?? BorderRadius.zero,
                      child: CachedNetworkImage(
                        imageUrl: configuration.imageUrl,
                        height: configuration.height,
                        width: configuration.width,
                        fit: configuration.boxFit,
                        placeholder: (context, url) => SizedBox(
                          height: configuration.height,
                          width: configuration.width,
                          child: const Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Color(0xFF023047)),
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                : this.widget),
        configuration: configuration ?? this.configuration);
  }

  @override
  List<Object> get props => [id, type, widget, configuration];
}
