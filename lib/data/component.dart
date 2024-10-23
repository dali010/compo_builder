import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';

class Component extends Equatable {
  final String iconAsset;
  final WidgetType type;

  const Component({required this.iconAsset, required this.type});

  @override
  List<Object> get props => [iconAsset, type];
}
