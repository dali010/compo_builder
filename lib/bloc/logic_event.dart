part of 'logic_bloc.dart';

@immutable
sealed class LogicEvent {}

class OnDropComponentEvent extends LogicEvent {
  final WidgetType droppedComponentTitle;

  OnDropComponentEvent({required this.droppedComponentTitle});
}

class OnSelectDroppedComponentEvent extends LogicEvent {
  final String id;

  OnSelectDroppedComponentEvent({required this.id});
}
