import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class DroppedComponent extends Equatable {
  final String id;
  final WidgetType type;
  final bool isSelected;

  // Create an instance of Uuid to generate unique IDs
  static const Uuid _uuid = Uuid();

  DroppedComponent({
    required this.type,
    this.isSelected = false,
  }) : id = _uuid.v4(); // Always generate a random ID

  DroppedComponent copyWith({WidgetType? type, bool? isSelected}) {
    return DroppedComponent(
      type: type ?? this.type,
      isSelected: isSelected ?? false,
    );
  }

  @override
  List<Object> get props => [id, type, isSelected];
}