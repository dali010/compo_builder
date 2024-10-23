import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:compo_builder/widget_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneScreen extends StatelessWidget {
  final List<CustomWidget> droppedComponents;
  final Function(WidgetType, int) onSelectComponent;
  final WidgetType? selectedComponent;

  const PhoneScreen({
    super.key,
    required this.droppedComponents,
    required this.onSelectComponent,
    required this.selectedComponent,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<WidgetType>(
      builder: (BuildContext context, List<WidgetType?> candidateData, List<dynamic> rejectedData) {
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
          child: Column(
            children: droppedComponents.map((component) {
              return GestureDetector(
                onTap: () {
                  // Pass both the component type and the index
                  onSelectComponent(component.type, droppedComponents.indexOf(component));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedComponent == component.type ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: WidgetFactory.createWidget(component.type),
                ),
              );
            }).toList(),
          ),
        );
      },
      onWillAcceptWithDetails: (details) {
        // Always accept the drop
        return true;
      },
      onAcceptWithDetails: (details) {
        // Get the actual widget type from the dragged data
        final draggedComponentType = details.data;

        // Trigger the drop event in the BLoC with the correct type
        BlocProvider.of<LogicBloc>(context).add(
          OnDropComponentEvent(
            droppedComponent: CustomWidget(type: draggedComponentType), // Use the correct type
          ),
        );
      },
    );
  }
}
