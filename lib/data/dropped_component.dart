import 'package:compo_builder/data/text_configuration.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../widget_factory.dart';

class DroppedComponent extends Equatable {
  final String id;
  final WidgetType type;
  final bool isSelected;
  final Widget widget;
  final CustomConfiguration configuration;

  // Create an instance of Uuid to generate unique IDs
  static const Uuid _uuid = Uuid();

  DroppedComponent({
    required this.type,
    this.isSelected = true,
    Widget? widget,
    CustomConfiguration? configuration,
  })  : id = _uuid.v4(),
        widget = widget ?? WidgetFactory.createWidget(type),
        configuration =
            configuration ?? CustomConfiguration.createConfiguration(type);

  DroppedComponent copyWith(
      {WidgetType? type,
      bool? isSelected,
      Widget? widget,
      CustomConfiguration? configuration}) {
    return DroppedComponent(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      widget: widget ?? (configuration != null
              ? this.type == WidgetType.text
                  ? Text((configuration as TextConfiguration).text)
                  : this.widget
              : this.widget),
      configuration: configuration ?? this.configuration,
    );
  }

  @override
  List<Object> get props => [id, type, isSelected, widget, configuration];
}
