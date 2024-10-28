import 'logic_bloc.dart';

class UpdateTextValueEvent extends UpdateTextEvent {
  final String newText;

  UpdateTextValueEvent({required this.newText});
}
