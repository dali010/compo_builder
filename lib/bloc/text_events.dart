import 'dart:ui';

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
