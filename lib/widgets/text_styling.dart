import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/text_configuration.dart';
import 'package:compo_builder/widgets/font_styling.dart';
import 'package:compo_builder/widgets/text_align_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/text_events.dart';

enum FontStyles { normal, italic, underline, lineThrough }

class TextStyling extends StatefulWidget {
  final TextConfiguration configuration;

  const TextStyling({super.key, required this.configuration});

  @override
  State<TextStyling> createState() => _TextStylingState();
}

class _TextStylingState extends State<TextStyling> {
  late final TextEditingController _editingController;
  late final TextEditingController _editingColorController;
  late final TextEditingController _editingFontSizeController;
  late final TextEditingController _editingLineHeightController;
  late final TextEditingController _editingLetterSpacingController;
  late final TextEditingController _editingMaxLinesController;

  @override
  void initState() {
    _editingColorController = TextEditingController(
        text:
            '#${widget.configuration.color.value.toRadixString(16).substring(2)}');
    _editingFontSizeController =
        TextEditingController(text: widget.configuration.fontSizeValue);
    _editingController = TextEditingController(text: widget.configuration.text);
    _editingLineHeightController =
        TextEditingController(text: widget.configuration.lineHeightValue);
    _editingLetterSpacingController =
        TextEditingController(text: widget.configuration.letterSpacingValue);
    _editingMaxLinesController =
        TextEditingController(text: widget.configuration.maxLinesValue);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextStyling oldWidget) {
    if (oldWidget.configuration != widget.configuration) {
      _editingController.text = widget.configuration.text;
      _editingFontSizeController.text = widget.configuration.fontSizeValue;
      _editingLineHeightController.text = widget.configuration.lineHeightValue;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  String selectedTextStyle = 'Regular';
  String selectedFontFamily = 'Roboto';
  String selectedFontWeight = 'Normal';

  Color selectedColor = Colors.black;

  // Method to show color picker
  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: widget.configuration.color,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color; // Update the selected color
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Select'),
              onPressed: () {
                BlocProvider.of<LogicBloc>(context)
                    .add(UpdateColorEvent(color: selectedColor));
                setState(() {
                  _editingColorController.text =
                      '#${selectedColor.value.toRadixString(16).substring(2)}';
                });
                Navigator.of(context).pop(); // Close the color picker
              },
            ),
          ],
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text field for changing the text of the component...
        TextFormField(
          controller: _editingController,
          style: const TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w100),
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
            BlocProvider.of<LogicBloc>(context).add(UpdateTextValueEvent(
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
          width: double.infinity,
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
                      BlocProvider.of<LogicBloc>(context)
                          .add(UpdateFontWeightEvent(
                        fontWeight: newValue!,
                      ));
                      setState(() {
                        selectedFontWeight = newValue;
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
                    FontStyling(
                        onTap: (unselect) {
                          BlocProvider.of<LogicBloc>(context).add(
                              UpdateFontStyleEvent(
                                  fontStyle: unselect
                                      ? FontStyles.normal
                                      : FontStyles.italic));
                        },
                        isFirst: true,
                        fontStyle: FontStyles.italic,
                        isSelected: widget.configuration.fontStyle ==
                            FontStyles.italic),
                    FontStyling(
                        onTap: (unselect) {
                          BlocProvider.of<LogicBloc>(context).add(
                              UpdateFontStyleEvent(
                                  fontStyle: unselect
                                      ? FontStyles.normal
                                      : FontStyles.underline));
                        },
                        fontStyle: FontStyles.underline,
                        isSelected: widget.configuration.fontStyle ==
                            FontStyles.underline),
                    FontStyling(
                        onTap: (unselect) {
                          BlocProvider.of<LogicBloc>(context).add(
                              UpdateFontStyleEvent(
                                  fontStyle: unselect
                                      ? FontStyles.normal
                                      : FontStyles.lineThrough));
                        },
                        fontStyle: FontStyles.lineThrough,
                        isSelected: widget.configuration.fontStyle ==
                            FontStyles.lineThrough)
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Font Size and Text Color in a Row...
        Row(
          children: [
            // Font Size Input Field
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Font Size',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _editingFontSizeController,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => BlocProvider.of<LogicBloc>(context)
                        .add(UpdateFontSizeEvent(fontSize: value)),
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Text Color Input and Color Picker
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Text Color',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Text Color Input Field and Color Picker Button...
                  Row(
                    children: [
                      // TextField for hex color input
                      Expanded(
                        child: TextFormField(
                          controller: _editingColorController,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            setState(() {
                              // Ensure the value starts with a '#' and is a valid hex color
                              if (value.startsWith('#') && value.length == 7) {
                                try {
                                  BlocProvider.of<LogicBloc>(context).add(
                                      UpdateColorEvent(
                                          color: Color(int.parse(
                                                  value.substring(1),
                                                  radix: 16) +
                                              0xFF000000)));
                                } catch (e) {
                                  // Handle invalid hex input
                                }
                              }
                            });
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(7),
                          ],
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
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Color Picker Button
                      GestureDetector(
                        onTap: () => pickColor(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: widget.configuration.color,
                            // Show selected color
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF8E8E93),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Line Height and Letter Spacing in a Row...
        Row(
          children: [
            // Line Height Input Field
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Line Height',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF8E8E93),
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _editingLineHeightController,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => BlocProvider.of<LogicBloc>(context)
                        .add(UpdateLineHeightEvent(lineHeight: value)),
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            // Letter Spacing Input Field...
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Letter Spacing',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF8E8E93),
                        size: 15,
                      ),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _editingLetterSpacingController,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => BlocProvider.of<LogicBloc>(context)
                        .add(UpdateLetterSpacingEvent(letterSpacing: value)),
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
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // Text Alignment Icon buttons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Text Align',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8E8E93),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left Align button
                      TextAlignWidget(
                          onTap: (unselect) =>
                              BlocProvider.of<LogicBloc>(context).add(
                                  UpdateTextAlignEvent(
                                      textAlign: unselect
                                          ? TextAlign.start
                                          : TextAlign.left)),
                          iconData: Icons.format_align_left,
                          isFirst: true,
                          isSelected:
                              widget.configuration.textAlign == TextAlign.left),
                      // Center Align button
                      TextAlignWidget(
                          onTap: (unselect) =>
                              BlocProvider.of<LogicBloc>(context).add(
                                  UpdateTextAlignEvent(
                                      textAlign: unselect
                                          ? TextAlign.start
                                          : TextAlign.center)),
                          iconData: Icons.format_align_center,
                          isSelected: widget.configuration.textAlign ==
                              TextAlign.center),
                      // Right Align button
                      TextAlignWidget(
                          onTap: (unselect) =>
                              BlocProvider.of<LogicBloc>(context).add(
                                  UpdateTextAlignEvent(
                                      textAlign: unselect
                                          ? TextAlign.start
                                          : TextAlign.right)),
                          iconData: Icons.format_align_right,
                          isSelected: widget.configuration.textAlign ==
                              TextAlign.right),
                      // Justify Align button
                      TextAlignWidget(
                          onTap: (unselect) =>
                              BlocProvider.of<LogicBloc>(context).add(
                                  UpdateTextAlignEvent(
                                      textAlign: unselect
                                          ? TextAlign.start
                                          : TextAlign.justify)),
                          iconData: Icons.format_align_right,
                          isLast: true,
                          isSelected: widget.configuration.textAlign ==
                              TextAlign.justify),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Max Lines Input Field...
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Max Lines',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF8E8E93),
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40, // Adjust the height of the text field
                    child: TextFormField(
                      controller: _editingMaxLinesController,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => BlocProvider.of<LogicBloc>(context)
                          .add(UpdateMaxLinesEvent(maxLines: value)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: const Color(0xFF2E3741).withOpacity(0.8),
                            width: 1.0,
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
