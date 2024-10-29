import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';

class ContainerStyling extends StatefulWidget {
  final int componentIndex;

  const ContainerStyling({
    Key? key,
    required this.componentIndex,
  }) : super(key: key);

  @override
  _ContainerStylingState createState() => _ContainerStylingState();
}

class _ContainerStylingState extends State<ContainerStyling> {
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TextEditingController _fillColorController;
  late TextEditingController _borderColorController;
  Color fillColor = Colors.white;
  Color borderColor = Colors.black;

  void pickColor(BuildContext context, bool isFillColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: isFillColor ? fillColor : borderColor,
              onColorChanged: (Color color) {
                setState(() {
                  if (isFillColor) {
                    fillColor = color;
                    _fillColorController.text =
                        '#${color.value.toRadixString(16).substring(2)}';
                  } else {
                    borderColor = color;
                    _borderColorController.text =
                        '#${color.value.toRadixString(16).substring(2)}';
                  }
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Select'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _widthController = TextEditingController(text: "178");
    _heightController = TextEditingController(text: "200");
    _fillColorController = TextEditingController(
        text: '#${fillColor.value.toRadixString(16).substring(2)}');
    _borderColorController = TextEditingController(
        text: '#${borderColor.value.toRadixString(16).substring(2)}');
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _fillColorController.dispose();
    _borderColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildDimensionInput("Width", _widthController),
              const SizedBox(width: 20),
              _buildDimensionInput("Height", _heightController),
            ],
          ),
          const SizedBox(height: 10),
          _buildColorSection(
              "Fill Color", _fillColorController, fillColor, true),
          const SizedBox(height: 10),
          _buildColorSection(
              "Border Color", _borderColorController, borderColor, false),
          const SizedBox(height: 10),
          // Border Radius...

          Row(
            children: [
              const Text(
                'Border Radius',
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

          // Border Radius Input Fields...
          Row(
            children: [
              // Top Left...
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: 'TL',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the line height
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
                    TextFormField(
                      initialValue: 'TR',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the letter spacing
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              // Top Left...
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: 'BL',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the line height
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
                    TextFormField(
                      initialValue: 'BR',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the letter spacing
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Border Width and elevation section...
          Row(
            children: [
              // Border Width Input Field
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Border Width',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
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
                      initialValue: '1.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the line height
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              // Elevation Input Field...
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Elevation',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset(
                          'assets/icons/settings_ic.svg',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: '0.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the letter spacing
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Min Height and Min Width section...
          Row(
            children: [
              // Min Width Input Field
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Min W',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
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
                      initialValue: '1.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the line height
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              // Min Height Input Field...
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Min H',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset(
                          'assets/icons/settings_ic.svg',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: '0.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the letter spacing
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Max Height and Max Width section...
          Row(
            children: [
              // Min Width Input Field
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          ' W',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
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
                      initialValue: '1.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the line height
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              // Min Height Input Field...
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Max H',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset(
                          'assets/icons/settings_ic.svg',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: '0.0',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // Update the letter spacing
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDimensionInput(String label, TextEditingController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
              const SizedBox(width: 5),
              SvgPicture.asset('assets/icons/settings_ic.svg',
                  width: 16, height: 16),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.number,
            decoration: _inputDecoration(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildColorSection(String label, TextEditingController controller,
      Color color, bool isFillColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label,
                style: const TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/icons/settings_ic.svg',
                width: 16, height: 16),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                onChanged: (value) {
                  if (value.startsWith('#') && value.length == 7) {
                    try {
                      final parsedColor = Color(
                          int.parse(value.substring(1), radix: 16) +
                              0xFF000000);
                      setState(() => isFillColor
                          ? fillColor = parsedColor
                          : borderColor = parsedColor);
                    } catch (e) {
                      // Handle invalid hex input
                    }
                  }
                },
                decoration: _inputDecoration(),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => pickColor(context, isFillColor),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: const Color(0xFF8E8E93), width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF2E3741).withOpacity(0.8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
            color: const Color(0xFF2E3741).withOpacity(0.8), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF8E8E93), width: 2),
      ),
    );
  }
}
