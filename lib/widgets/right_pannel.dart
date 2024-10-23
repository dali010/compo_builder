import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightPanel extends StatelessWidget {
  final WidgetType? selectedComponent;
  final int index;

  const RightPanel({super.key, required this.selectedComponent, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (selectedComponent != null) ...[
            Text(
              'Component: ${selectedComponent!.value}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text('Text Settings', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "Sample Text",
              decoration: const InputDecoration(labelText: 'Text'),
              onChanged: (value) {
                BlocProvider.of<LogicBloc>(context)
                    .add(UpdateComponentTextEvent(
                  componentIndex: index, // index of the component in the droppedComponents list
                  newText: "New Text",
                ));
              },
            ),
            const SizedBox(height: 20),
            const Text('Color Settings', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            DropdownButton<Color>(
              value: Colors.black,
              items: [
                DropdownMenuItem(value: Colors.black, child: Text('Black')),
                DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
                DropdownMenuItem(value: Colors.red, child: Text('Red')),
              ],
              onChanged: (Color? newColor) {
                BlocProvider.of<LogicBloc>(context).add(UpdateComponentColorEvent(
                  componentIndex: index, // index of the component in the droppedComponents list
                  newColor: Colors.red,
                ));
              },
            ),
            const SizedBox(height: 20),
            const Text('Size Settings', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Slider(
              value: 100,
              min: 50,
              max: 200,
              divisions: 10,
              label: 'Size',
              onChanged: (double newSize) {
                BlocProvider.of<LogicBloc>(context).add(UpdateComponentSizeEvent(
                  componentIndex: index, // index of the component in the droppedComponents list
                  newSize: Size(200, 200),
                ));
              },
            ),
          ] else ...[
            const Text(
              'No component selected',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ]
        ],
      ),
    );
  }
}