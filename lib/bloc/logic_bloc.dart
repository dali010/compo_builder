import 'package:compo_builder/bloc/update_text_event.dart';
import 'package:compo_builder/data/component.dart';
import 'package:compo_builder/data/text_configuration.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart' as constants;
import '../data/dropped_component.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class LogicBloc extends Bloc<LogicEvent, LogicState> {
  LogicBloc() : super(const LogicState()) {
    on<LogicEvent>((event, emit) {});
    on<OnDropComponentEvent>(_onDropComponent);
    on<OnSelectDroppedComponentEvent>(_onSelectDroppedComponent);
    on<UpdateTextEvent>(_onUpdateText);
  }

  void _onDropComponent(OnDropComponentEvent event, Emitter<LogicState> emit) {
    List<DroppedComponent> unselectedList = state.droppedComponents
        .map((component) => component.copyWith(isSelected: false))
        .toList();
    emit(state.copyWith(droppedComponents: [
      ...unselectedList,
      DroppedComponent(
        type: event.droppedComponentTitle,
      )
    ]));
  }

  void _onSelectDroppedComponent(
      OnSelectDroppedComponentEvent event, Emitter<LogicState> emit) {
    emit(state.copyWith(
        droppedComponents: state.droppedComponents
            .map((component) => component.id == event.id
                ? component.copyWith(isSelected: !component.isSelected)
                : component.copyWith(isSelected: false))
            .toList()));
  }

  void _onUpdateText(UpdateTextEvent event, Emitter<LogicState> emit) {
    if (event is UpdateTextValueEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as TextConfiguration)
                              .copyWith(text: event.newText))
                  : component.copyWith())
              .toList()));
    }
  }
}
