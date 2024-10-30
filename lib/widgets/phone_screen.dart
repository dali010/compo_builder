import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/dropped_component.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/widget_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneScreen extends StatefulWidget {
  final List<DroppedComponent> droppedComponents;

  const PhoneScreen({super.key, required this.droppedComponents});

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
          color: const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
        ),
        child: Column(
          children: widget.droppedComponents.map((component) {
            return GestureDetector(
              onTap: () => BlocProvider.of<LogicBloc>(context)
                  .add(OnSelectDroppedComponentEvent(id: component.id)),
              child: Stack(
                clipBehavior: Clip.none,
                // Allows positioning outside the widget's boundary
                children: [
                  Container(
                    decoration: component.isSelected
                        ? BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF369689),
                              width: 2,
                            ),
                          )
                        : null,
                    child: component.widget,
                  ),
                  if (component.isSelected)
                    Positioned(
                      top: -17,
                      // Adjust this to move the green container higher
                      left: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF369689),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          border: Border(
                            top: BorderSide(color: Color(0xFF2A7A70), width: 2),   // Top border
                            left: BorderSide(color: Color(0xFF2A7A70), width: 2),  // Left border
                            right: BorderSide(color: Color(0xFF2A7A70), width: 2), // Right border
                          ),
                        ),
                        // The color of the small container
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child:  Text(
                          component.type.value, // Your text here
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    }, onWillAcceptWithDetails: (details) {
      return true;
      ;
    }, onAcceptWithDetails: (details) {
      BlocProvider.of<LogicBloc>(context)
          .add(OnDropComponentEvent(droppedComponentTitle: details.data));
    });
  }
}
