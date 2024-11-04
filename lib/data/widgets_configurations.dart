import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/widgets/text_styling.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CustomConfiguration extends Equatable {
  const CustomConfiguration();

  static CustomConfiguration createConfiguration(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.text:
        return const TextConfiguration();
      case WidgetType.image:
        return ImageConfiguration();
      case WidgetType.button:
        return const ButtonConfiguration();
      default:
        return const TextConfiguration();
    }
  }
}

class TextConfiguration extends CustomConfiguration {
  final String text;
  final Color color;
  final double fontSize;
  final String fontSizeValue;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontStyles fontStyle;
  final double? lineHeight;
  final String lineHeightValue;
  final double? letterSpacing;
  final String letterSpacingValue;
  final int? maxLines;
  final String maxLinesValue;

  const TextConfiguration({
    this.text = 'Hello World',
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontSizeValue = '14',
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.decoration = TextDecoration.none,
    this.fontStyle = FontStyles.normal,
    this.lineHeight,
    this.lineHeightValue = '',
    this.letterSpacing,
    this.letterSpacingValue = '',
    this.maxLines,
    this.maxLinesValue = '',
  });

  TextConfiguration copyWith({
    String? text,
    Color? color,
    double? fontSize,
    String? fontSizeValue,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? decoration,
    FontStyles? fontStyle,
    double? lineHeight,
    String? lineHeightValue,
    double? letterSpacing,
    String? letterSpacingValue,
    int? maxLines,
    String? maxLinesValue,
  }) {
    return TextConfiguration(
      text: text ?? this.text,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontSizeValue: fontSizeValue ?? this.fontSizeValue,
      fontWeight: fontWeight ?? this.fontWeight,
      textAlign: textAlign == null
          ? this.textAlign
          : textAlign == TextAlign.start
              ? null
              : textAlign,
      fontStyle: fontStyle ?? this.fontStyle,
      lineHeight: lineHeight ??
          ((lineHeightValue?.isEmpty == true) ? null : this.lineHeight),
      lineHeightValue: lineHeightValue ?? this.lineHeightValue,
      letterSpacing: letterSpacing ??
          ((letterSpacingValue?.isEmpty == true) ? null : this.letterSpacing),
      letterSpacingValue: letterSpacingValue ?? this.letterSpacingValue,
      maxLines:
          maxLines ?? ((maxLinesValue?.isEmpty == true) ? null : this.maxLines),
      maxLinesValue: maxLinesValue ?? this.maxLinesValue,
    );
  }

  @override
  List<Object?> get props => [
        text,
        color,
        fontSize,
        fontSizeValue,
        fontWeight,
        textAlign,
        decoration,
        fontStyle,
        lineHeight,
        lineHeightValue,
        letterSpacing,
        letterSpacingValue,
        maxLines,
        maxLinesValue
      ];
}

class ImageConfiguration extends CustomConfiguration {
  final double opacity;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;
  final String imageUrl;

  ImageConfiguration(
      {this.opacity = 1,
      this.width = 100,
      this.height = 100,
      this.borderRadius = const BorderRadius.all(Radius.circular(0)),
      this.boxFit = BoxFit.cover,
      String? imageUrl})
      : imageUrl = imageUrl ??
            'https://picsum.photos/100?random=${DateTime.now().millisecondsSinceEpoch}';

  ImageConfiguration copyWith({
    double? opacity,
    double? width,
    double? height,
    double? borderRadius,
    BoxFit? boxFit,
    String? imageUrl,
  }) {
    return ImageConfiguration(
        opacity: opacity ?? this.opacity,
        width: width ?? this.width,
        height: height ?? this.height,
        borderRadius: borderRadius == null
            ? this.borderRadius
            : BorderRadius.all(Radius.circular(borderRadius)),
        boxFit: boxFit ?? this.boxFit,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  @override
  List<Object?> get props =>
      [opacity, width, height, borderRadius, boxFit, imageUrl];
}

// button configuration...
class ButtonConfiguration extends CustomConfiguration {
  final String text;
  final Color color;
  final double fontSize;
  final String fontSizeValue;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontStyles fontStyle;
  final double? lineHeight;
  final String lineHeightValue;
  final double? letterSpacing;
  final String letterSpacingValue;

  const ButtonConfiguration({
    this.text = 'Button',
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontSizeValue = '14',
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.decoration = TextDecoration.none,
    this.fontStyle = FontStyles.normal,
    this.lineHeight,
    this.lineHeightValue = '',
    this.letterSpacing,
    this.letterSpacingValue = '',
  });

  ButtonConfiguration copyWith({
    String? text,
    Color? color,
    double? fontSize,
    String? fontSizeValue,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyles? fontStyle,
    double? lineHeight,
    String? lineHeightValue,
    double? letterSpacing,
    String? letterSpacingValue,
  }) {
    return ButtonConfiguration(
      text: text ?? this.text,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontSizeValue: fontSizeValue ?? this.fontSizeValue,
      fontWeight: fontWeight ?? this.fontWeight,
      textAlign: textAlign == null
          ? this.textAlign
          : textAlign == TextAlign.start
              ? null
              : textAlign,
      fontStyle: fontStyle ?? this.fontStyle,
      lineHeight: lineHeight ??
          ((lineHeightValue?.isEmpty == true) ? null : this.lineHeight),
      lineHeightValue: lineHeightValue ?? this.lineHeightValue,
      letterSpacing: letterSpacing ??
          ((letterSpacingValue?.isEmpty == true) ? null : this.letterSpacing),
      letterSpacingValue: letterSpacingValue ?? this.letterSpacingValue,
    );
  }

  @override
  List<Object?> get props => [
        text,
        color,
        fontSize,
        fontSizeValue,
        fontWeight,
        textAlign,
        decoration,
        fontStyle,
        lineHeight,
        lineHeightValue,
        letterSpacing,
        letterSpacingValue,
      ];
}