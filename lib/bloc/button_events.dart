import 'dart:ui';

import '../widgets/text_styling.dart';
import 'logic_bloc.dart';

class UpdateOpacityEvent extends UpdateButtonEvent {
  final double opacity;

  UpdateOpacityEvent({required this.opacity});
}

class UpdateButtonTextValueEvent extends UpdateButtonEvent {
  final String newText;

  UpdateButtonTextValueEvent({required this.newText});
}

class UpdateButtonColorEvent extends UpdateButtonEvent {
  final Color color;

  UpdateButtonColorEvent({required this.color});
}

class UpdateButtonFontWeightEvent extends UpdateButtonEvent {
  final String fontWeight;

  UpdateButtonFontWeightEvent({required this.fontWeight});
}

class UpdateButtonFontSizeEvent extends UpdateButtonEvent {
  final String fontSize;

  UpdateButtonFontSizeEvent({required this.fontSize});
}

class UpdateButtonFontStyleEvent extends UpdateButtonEvent {
  final FontStyles fontStyle;

  UpdateButtonFontStyleEvent({required this.fontStyle});
}

class UpdateButtonLineHeightEvent extends UpdateButtonEvent {
  final String lineHeight;

  UpdateButtonLineHeightEvent({required this.lineHeight});
}

class UpdateButtonLetterSpacingEvent extends UpdateButtonEvent {
  final String letterSpacing;

  UpdateButtonLetterSpacingEvent({required this.letterSpacing});
}