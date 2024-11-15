import 'dart:ui';

import 'package:compo_builder/widgets/text_styling.dart';
import 'package:flutter/cupertino.dart';

import 'logic_bloc.dart';

class UpdateOpacityEvent extends UpdateImageEvent {
  final double opacity;

  UpdateOpacityEvent({required this.opacity});
}

// update width of the image...
class UpdateWidthEvent extends UpdateImageEvent {
  final String width;

  UpdateWidthEvent({required this.width});
}

// update height of the image...
class UpdateHeightEvent extends UpdateImageEvent {
  final String height;

  UpdateHeightEvent({required this.height});
}

// update border radius of the image...
class UpdateBorderRadiusEvent extends UpdateImageEvent {
  final String borderRadius;

  UpdateBorderRadiusEvent({required this.borderRadius});
}

// update image url...
class UpdateImageUrlEvent extends UpdateImageEvent {
  final String imageUrl;

  UpdateImageUrlEvent({required this.imageUrl});
}

// update image box fit...
class UpdateBoxFitEvent extends UpdateImageEvent {
  final BoxFit boxFit;

  UpdateBoxFitEvent({required this.boxFit});
}