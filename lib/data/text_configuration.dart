import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


@immutable
sealed class CustomConfiguration extends Equatable {
  const CustomConfiguration();

  static CustomConfiguration createConfiguration(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.text:
        return const TextConfiguration();
      default:
        return const TextConfiguration();
    }
  }
}

class TextConfiguration extends CustomConfiguration {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;

  const TextConfiguration({
    this.text = 'Hello World' ,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
  });

  TextConfiguration copyWith({
    String? text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? decoration,
  }) {
    print('fdsjkfjkdsfhkj $fontWeight');
    return TextConfiguration(
      text: text ?? this.text,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      textAlign: textAlign ?? this.textAlign,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  List<Object?> get props => [text, color, fontSize, fontWeight, textAlign, decoration];
}
