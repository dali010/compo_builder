import 'dart:ui';

import 'package:compo_builder/widgets/text_styling.dart';

import 'logic_bloc.dart';

class UpdateOpacityEvent extends UpdateImageEvent {
  final double opacity;

  UpdateOpacityEvent({required this.opacity});
}

// update width of the image
class UpdateWidthEvent extends UpdateImageEvent {
  final String width;

  UpdateWidthEvent({required this.width});
}

// update height of the image
class UpdateHeightEvent extends UpdateImageEvent {
  final String height;

  UpdateHeightEvent({required this.height});
}