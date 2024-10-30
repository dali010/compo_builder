import 'dart:ui';

import 'package:compo_builder/widgets/text_styling.dart';

import 'logic_bloc.dart';

class UpdateTextValueEvent extends UpdateTextEvent {
  final String newText;

  UpdateTextValueEvent({required this.newText});
}

class UpdateColorEvent extends UpdateTextEvent {
  final Color color;

  UpdateColorEvent({required this.color});
}

class UpdateFontWeightEvent extends UpdateTextEvent {
  final String fontWeight;

  UpdateFontWeightEvent({required this.fontWeight});
}

class UpdateFontSizeEvent extends UpdateTextEvent {
  final String fontSize;

  UpdateFontSizeEvent({required this.fontSize});
}

class UpdateFontStyleEvent extends UpdateTextEvent {
  final FontStyles fontStyle;

  UpdateFontStyleEvent({required this.fontStyle});
}

class UpdateTextAlignEvent extends UpdateTextEvent {
  final TextAlign? textAlign;

  UpdateTextAlignEvent({required this.textAlign});
}

class UpdateLineHeightEvent extends UpdateTextEvent {
  final String lineHeight;

  UpdateLineHeightEvent({required this.lineHeight});
}

class UpdateLetterSpacingEvent extends UpdateTextEvent {
  final String letterSpacing;

  UpdateLetterSpacingEvent({required this.letterSpacing});
}

class UpdateMaxLinesEvent extends UpdateTextEvent {
  final String maxLines;

  UpdateMaxLinesEvent({required this.maxLines});
}
