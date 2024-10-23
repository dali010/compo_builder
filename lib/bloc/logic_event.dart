part of 'logic_bloc.dart';

@immutable
sealed class LogicEvent {}

class OnDropComponentEvent extends LogicEvent {
  final CustomWidget droppedComponent;

  OnDropComponentEvent({required this.droppedComponent});
}

class UpdateComponentTextEvent extends LogicEvent {
  final int componentIndex;
  final String newText;

  UpdateComponentTextEvent({required this.componentIndex, required this.newText});
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
