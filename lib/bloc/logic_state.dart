part of 'logic_bloc.dart';

class LogicState extends Equatable {
  final List<Component> components;

  const LogicState({this.components = constants.components});

  @override
  List<Object?> get props => [components];
}
