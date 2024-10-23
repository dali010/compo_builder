import 'package:compo_builder/data/component.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart' as constants;

part 'logic_event.dart';
part 'logic_state.dart';

class LogicBloc extends Bloc<LogicEvent, LogicState> {
  LogicBloc() : super(const LogicState()) {
    on<LogicEvent>((event, emit) {});
    on<OnDropComponentEvent>(_onDropComponent);
    on<UpdateComponentTextEvent>(_onUpdateComponentText);
    on<UpdateComponentColorEvent>(_onUpdateComponentColor);
    on<UpdateComponentSizeEvent>(_onUpdateComponentSize);
  }

  void _onDropComponent(OnDropComponentEvent event, Emitter<LogicState> emit) {
    emit(state.copyWith(droppedComponents: [
      ...state.droppedComponents,
      event.droppedComponent
    ]));
  }



  void _onUpdateComponentText(UpdateComponentTextEvent event, Emitter<LogicState> emit) {
    // Get the component to update by index
    List<CustomWidget> updatedComponents = List.from(state.droppedComponents);
    CustomWidget componentToUpdate = updatedComponents[event.componentIndex];

    // Update the component's text
    updatedComponents[event.componentIndex] = componentToUpdate.copyWith(text: event.newText);

    // Emit the updated state
    emit(state.copyWith(droppedComponents: updatedComponents));
  }

  void _onUpdateComponentColor(UpdateComponentColorEvent event, Emitter<LogicState> emit) {
    // Similar logic for color update
    List<CustomWidget> updatedComponents = List.from(state.droppedComponents);
    CustomWidget componentToUpdate = updatedComponents[event.componentIndex];

    // Update the component's color
    updatedComponents[event.componentIndex] = componentToUpdate.copyWith(color: event.newColor);

    // Emit the updated state
    emit(state.copyWith(droppedComponents: updatedComponents));
  }

  void _onUpdateComponentSize(UpdateComponentSizeEvent event, Emitter<LogicState> emit) {
    // Similar logic for size update
    List<CustomWidget> updatedComponents = List.from(state.droppedComponents);
    CustomWidget componentToUpdate = updatedComponents[event.componentIndex];

    // Update the component's size
    updatedComponents[event.componentIndex] = componentToUpdate.copyWith(size: event.newSize);

    // Emit the updated state
    emit(state.copyWith(droppedComponents: updatedComponents));
  }
}
