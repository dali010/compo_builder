import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/widget_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneScreen extends StatefulWidget {
   List<WidgetType> droppedComponents;

   PhoneScreen({super.key, required this.droppedComponents});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<WidgetType>(builder: (BuildContext context,
        List<WidgetType?> candidateData, List<dynamic> rejectedData) {
      return Container(
        width: 260,
        height: 520,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
        ),
        child: const Column(
          children: [],
        ),
      );
    }, onWillAcceptWithDetails: (details) {
      return true;
      ;
    }, onAcceptWithDetails: (details) {
      print("yoooooooo  ${details.data}");

      BlocProvider.of<LogicBloc>(context)
          .add(OnDropComponentEvent(droppedComponentTitle: details.data));
    });
  }
}
