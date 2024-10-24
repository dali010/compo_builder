import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widget_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightPanel extends StatelessWidget {
  final WidgetType? selectedComponent;

  const RightPanel({super.key, required this.selectedComponent});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF14181B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2E3741).withOpacity(0.8),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          if (selectedComponent != null) ...[
            Text(
              'Component: ${selectedComponent!.value}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text('Text Settings', style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "Sample Text",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF8E8E93),
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                BlocProvider.of<LogicBloc>(context).add(UpdateComponentTextEvent(
                  componentIndex: 0,
                  newText: value,
                ));
              },
            ),
            const SizedBox(height: 20),
            const Text('Color Settings',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            const SizedBox(height: 10),
            DropdownButton<Color>(
              value: Colors.black,
              items: [
                DropdownMenuItem(value: Colors.black, child: Text('Black')),
                DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
                DropdownMenuItem(value: Colors.red, child: Text('Red')),
              ],
              onChanged: (Color? newColor) {
                BlocProvider.of<LogicBloc>(context)
                    .add(UpdateComponentColorEvent(
                  componentIndex:
                      0, // index of the component in the droppedComponents list
                  newColor: Colors.red,
                ));
              },
            ),
            const SizedBox(height: 20),
            const Text('Size Settings',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            const SizedBox(height: 10),
            Slider(
              value: 100,
              min: 50,
              max: 200,
              divisions: 10,
              label: 'Size',
              onChanged: (double newSize) {
                BlocProvider.of<LogicBloc>(context)
                    .add(UpdateComponentSizeEvent(
                  componentIndex:
                      0, // index of the component in the droppedComponents list
                  newSize: Size(200, 200),
                ));
              },
            ),
          ] else ...[
            const Text(
              'No component selected',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ]
        ],
      ),
    );
  }
}
