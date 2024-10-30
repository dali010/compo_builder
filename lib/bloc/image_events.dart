import 'dart:ui';

import 'package:compo_builder/widgets/text_styling.dart';

import 'logic_bloc.dart';

class UpdateOpacityEvent extends UpdateImageEvent {
  final double opacity;

  UpdateOpacityEvent({required this.opacity});
}
