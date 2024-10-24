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

  // Create an instance of Uuid to generate unique IDs
  static const Uuid _uuid = Uuid();

  DroppedComponent({
    required this.type,
    this.isSelected = true,
    Widget? widget, // Add this parameter
  }) : id = _uuid.v4() , widget = widget ?? WidgetFactory.createWidget(type); // Always generate a random ID

  DroppedComponent copyWith({WidgetType? type, bool? isSelected, Widget? widget}) {
    return DroppedComponent(
      type: type ?? this.type,
      isSelected: isSelected ?? false,
      widget: widget ?? this.widget
    );
  }

  @override
  List<Object> get props => [id, type, isSelected, widget];
}