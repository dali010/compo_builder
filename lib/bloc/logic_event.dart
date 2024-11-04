part of 'logic_bloc.dart';

@immutable
sealed class LogicEvent {}

class OnDropComponentEvent extends LogicEvent {
  final WidgetType droppedComponentTitle;

  OnDropComponentEvent({required this.droppedComponentTitle});
}

abstract class UpdateTextEvent extends LogicEvent {
}

abstract class UpdateImageEvent extends LogicEvent {
}

abstract class UpdateButtonEvent extends LogicEvent {
}


class UpdateComponentColorEvent extends LogicEvent {
  final int componentIndex;
  final Color newColor;

  UpdateComponentColorEvent({required this.componentIndex, required this.newColor});
}

class UpdateComponentSizeEvent extends LogicEvent {
  final int componentIndex;
  final Size newSize;

  UpdateComponentSizeEvent(
      {required this.componentIndex, required this.newSize});
}

class OnSelectDroppedComponentEvent extends LogicEvent {
  final String id;

  OnSelectDroppedComponentEvent({required this.id});
}
