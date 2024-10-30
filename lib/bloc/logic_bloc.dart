import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:compo_builder/bloc/image_events.dart';
import 'package:compo_builder/bloc/text_events.dart';
import 'package:compo_builder/data/component.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/data/widgets_configurations.dart' as wg;
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
    on<UpdateTextEvent>(_onUpdateText, transformer: restartable());
    on<UpdateImageEvent>(_onUpdateImage);
  }

  void _onDropComponent(OnDropComponentEvent event, Emitter<LogicState> emit) {
    List<DroppedComponent> unselectedList = state.droppedComponents
        .map((component) => component.copyWith(isSelected: false))
        .toList();
    emit(state.copyWith(droppedComponents: [
      ...unselectedList,
      DroppedComponent(type: event.droppedComponentTitle)
    ]));
    if (event.droppedComponentTitle == WidgetType.image) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.ImageConfiguration)
                              .copyWith())
                  : component.copyWith())
              .toList()));
    }
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
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(text: event.newText))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateColorEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(color: event.color))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateFontWeightEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration: (component.configuration
                              as wg.TextConfiguration)
                          .copyWith(
                              fontWeight:
                                  getFontWeightFromString(event.fontWeight)))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateFontSizeEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(
                                  fontSize: event.fontSize.isNotEmpty
                                      ? double.parse(event.fontSize)
                                      : 14,
                                  fontSizeValue: event.fontSize))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateFontStyleEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(fontStyle: event.fontStyle))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateTextAlignEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(textAlign: event.textAlign))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateLineHeightEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(
                                  lineHeight: event.lineHeight.isNotEmpty
                                      ? double.parse(event.lineHeight)
                                      : null,
                                  lineHeightValue: event.lineHeight))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateLetterSpacingEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(
                                  letterSpacing: event.letterSpacing.isNotEmpty
                                      ? double.parse(event.letterSpacing)
                                      : null,
                                  letterSpacingValue: event.letterSpacing))
                  : component.copyWith())
              .toList()));
    } else if (event is UpdateMaxLinesEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.TextConfiguration)
                              .copyWith(
                                  maxLines: event.maxLines.isNotEmpty
                                      ? int.parse(event.maxLines)
                                      : null,
                                  maxLinesValue: event.maxLines))
                  : component.copyWith())
              .toList()));
    }
  }

  void _onUpdateImage(UpdateImageEvent event, Emitter<LogicState> emit) {
    if (event is UpdateOpacityEvent) {
      emit(state.copyWith(
          droppedComponents: state.droppedComponents
              .map((component) => component.isSelected
                  ? component.copyWith(
                      configuration:
                          (component.configuration as wg.ImageConfiguration)
                              .copyWith(opacity: event.opacity))
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
