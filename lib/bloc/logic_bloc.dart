import 'package:compo_builder/bloc/text_events.dart';
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
    } else if (event is UpdateColorEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as TextConfiguration)
                              .copyWith(color: event.color))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateFontWeightEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration: (component.configuration
                              as TextConfiguration)
                          .copyWith(
                              fontWeight:
                                  getFontWeightFromString(event.fontWeight)))
                  : component.copyWith())
              .toList()));
    }
  }

  FontWeight? getFontWeightFromString(String fontWeightString) {
    switch (fontWeightString.toLowerCase()) {
      case 'normal':
        return FontWeight.normal;
      case 'bold':
        return FontWeight.bold;
      case 'light':
        return FontWeight.w300;
      case 'medium':
        return FontWeight.w500;
      case 'semi-bold':
        return FontWeight.w600;
      case 'extra-bold':
        return FontWeight.w800;
      case '100':
        return FontWeight.w100;
      case '200':
        return FontWeight.w200;
      case '300':
        return FontWeight.w300;
      case '400':
        return FontWeight.w400;
      case '500':
        return FontWeight.w500;
      case '600':
        return FontWeight.w600;
      case '700':
        return FontWeight.w700;
      case '800':
        return FontWeight.w800;
      case '900':
        return FontWeight.w900;
      default:
        return null; // or throw an error if invalid
    }
  }
}
