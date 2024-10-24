import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:compo_builder/bloc/logic_bloc.dart';

class TextStyling extends StatefulWidget {
  final String initialValue;
  final int componentIndex;

  const TextStyling({
    Key? key,
    required this.initialValue,
    required this.componentIndex,
  }) : super(key: key);

  @override
  _TextStylingState createState() => _TextStylingState();
}

class _TextStylingState extends State<TextStyling> {
  String selectedTextStyle = 'Regular';
  String selectedFontFamily = 'Roboto';
  String selectedFontWeight = 'Normal';
  String selectedFontStyle = 'None';

  // List of text style options
  final List<String> textStyles = [
    'Regular',
    'Bold',
    'Italic',
    'Large',
    'Small',
    'Extra Large',
    'Extra Small',
  ];
  final List<String> fontWeights = [
    'Normal',
    'Bold',
    'Light',
    'Medium',
    'Semi-Bold',
    'Extra-Bold',
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900'
  ];
  final List<String> fontStyles = ['None', 'Italic', 'Underline'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text field for changing the text of the component...
        TextFormField(
          initialValue: widget.initialValue,
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
            contentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF2E3741).withOpacity(0.8),
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF2E3741).withOpacity(0.8),
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
              componentIndex: widget.componentIndex,
              newText: value,
            ));
          },
        ),
        // Divider...
        const Divider(
          color: Color(0xFF2E3741),
          thickness: 1.5,
          height: 30,
        ),
        // Text Properties...
        const Row(
          children: [
            Text(
              'Text Properties',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.info_outline,
              color: Color(0xFF8E8E93),
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Theme Text Style label and info icon
        const Row(
          children: [
            Text(
              'Theme Text Style',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8E8E93),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.info_outline,
              color: Color(0xFF8E8E93),
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Theme Text Style dropdown...
        DropdownButtonFormField<String>(
          value: selectedTextStyle,
          items: textStyles.map((String style) {
            return DropdownMenuItem<String>(
              value: style,
              child: Text(
                style,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedTextStyle = newValue!;
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2E3741).withOpacity(0.8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF2E3741).withOpacity(0.8),
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
          dropdownColor: const Color(0xFF2E3741),
        ),
        const SizedBox(height: 10),
        // Font Family label...
        const Text(
          'Font Family',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF8E8E93),
          ),
        ),
        const SizedBox(height: 10),
        // Font Family dropdown...
        SizedBox(
          width: 160,
          height: 40,
          child: DropdownButtonFormField<String>(
            value: selectedFontFamily,
            items: const [
              DropdownMenuItem<String>(
                value: 'Roboto',
                child: Text(
                  'Roboto',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Arial',
                child: Text(
                  'Arial',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Times New Roman',
                child: Text(
                  'Times New Roman',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                selectedFontFamily = newValue!;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF2E3741).withOpacity(0.8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color(0xFF2E3741).withOpacity(0.8),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF8E8E93),
                  width: 1,
                ),
              ),
            ),
            dropdownColor: const Color(0xFF2E3741),
          ),
        ),
        const SizedBox(height: 10),
        // Font Weight dropdown and Styling buttons in a Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Font Weight dropdown
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Font Weight',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8E8E93),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: selectedFontWeight,
                    items: fontWeights.map((String weight) {
                      return DropdownMenuItem<String>(
                        value: weight,
                        child: Text(
                          weight,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedFontWeight = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: const Color(0xFF2E3741).withOpacity(0.8),
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
                    dropdownColor: const Color(0xFF2E3741),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Styling label...
                const Text(
                  'Styling',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8E8E93),
                  ),
                ),
                const SizedBox(height: 10),
                // Font Weight dropdown...
                Row(
                  children: [
                    // Italic button
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedFontStyle = 'Italic';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: selectedFontStyle == 'Italic'
                              ? Colors.grey
                              : const Color(0xFF2E3741),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.format_italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Underline button
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedFontStyle = 'Underline';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: selectedFontStyle == 'Underline'
                              ? Colors.grey
                              : const Color(0xFF2E3741),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Icon(
                          Icons.format_underline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Strikethrough button
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedFontStyle = 'Strikethrough';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: selectedFontStyle == 'Strikethrough'
                              ? Colors.grey
                              : const Color(0xFF2E3741),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.format_strikethrough,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
