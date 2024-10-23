part of 'logic_bloc.dart';

class LogicState extends Equatable {
  final List<Component> components;
  final List<WidgetType> droppedComponents;

  const LogicState(
      {this.components = constants.components,
      this.droppedComponents = const []});

  LogicState copyWith(
      {List<Component>? components, List<WidgetType>? droppedComponents}) {
    return LogicState(
        components: components ?? this.components,
        droppedComponents: droppedComponents ?? this.droppedComponents);
  }

  @override
  List<Object?> get props => [components, droppedComponents];
}
