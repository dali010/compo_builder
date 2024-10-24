import 'package:compo_builder/data/component.dart';
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
  }

  void _onDropComponent(OnDropComponentEvent event, Emitter<LogicState> emit) {
    List<DroppedComponent> unselectedList = state.droppedComponents
        .map((component) => component.copyWith())
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
                : component.copyWith())
            .toList()));
  }
}
