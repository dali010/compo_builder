import 'package:equatable/equatable.dart';

class Component extends Equatable {
  final String iconAsset;
  final String title;

  const Component({required this.iconAsset, required this.title});

  @override
  List<Object> get props => [iconAsset, title];
}
