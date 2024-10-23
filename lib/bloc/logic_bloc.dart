import 'package:compo_builder/data/component.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart' as constants;

part 'logic_event.dart';
part 'logic_state.dart';

class LogicBloc extends Bloc<LogicEvent, LogicState> {
  LogicBloc() : super(LogicState()) {
    on<LogicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
