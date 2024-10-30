import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:compo_builder/bloc/image_events.dart';
import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/data/widgets_configurations.dart' as wg;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ImageStyling extends StatefulWidget {
  final wg.ImageConfiguration configuration;

  const ImageStyling({super.key, required this.configuration});

  @override
  State<ImageStyling> createState() => _ImageStylingState();
}

class _ImageStylingState extends State<ImageStyling> {
  double _opacity = 0.7;
  double _borderRadius = 10.0;
  late TextEditingController _opacityController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TextEditingController _borderRadiusController;
  String _imageType = 'Network';
  String? _imagePath;
  File? backgroundImage;

  @override
  void initState() {
    super.initState();
    _opacityController =
        TextEditingController(text: _opacity.toStringAsFixed(1));
    _widthController =
        TextEditingController(text: widget.configuration.width.toString());
    _heightController =
        TextEditingController(text: widget.configuration.height.toString());
    _borderRadiusController =
        TextEditingController(text: _borderRadius.toStringAsFixed(1));
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'svg'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        backgroundImage = File(result.files.first.path!);
        print('Image path: ${result.files.first.path}');
      });
    }
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _borderRadiusController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ImageStyling oldWidget) {
    if (oldWidget.configuration != widget.configuration) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Opacity row with slider and text field...
        Row(
          children: [
            const Text(
              'Opacity',
              style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93)),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.info_outline, color: Color(0xFF8E8E93), size: 15),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/icons/settings_ic.svg',
                width: 16, height: 16),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: SliderTheme(
                data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay),
                child: Slider(
                  value: _opacity,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  activeColor: const Color(0xFF5E5CE6),
                  onChanged: (value) {
                    BlocProvider.of<LogicBloc>(context)
                        .add(UpdateOpacityEvent(opacity: value));
                    setState(() {
                      _opacity = value;
                      _opacityController.text = _opacity.toStringAsFixed(1);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: TextFormField(
                controller: _opacityController,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: const Color(0xFF2E3741).withOpacity(0.8),
                        width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xFF8E8E93), width: 2),
                  ),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    double? newValue = double.tryParse(value);
                    if (newValue != null &&
                        newValue >= 0.0 &&
                        newValue <= 1.0) {
                      _opacity = newValue;
                    }
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Divider
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xFF8E8E93),
        ),
        const SizedBox(height: 10),
        // Width and Height input fields...
        Row(
          children: [
            // Width input field...
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Width',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF8E8E93))),
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
                          controller: _widthController,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xFF2E3741).withOpacity(0.8),
                                  width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xFF8E8E93), width: 2),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) =>
                              BlocProvider.of<LogicBloc>(context)
                                  .add(UpdateWidthEvent(width: value)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Height input field...
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Height',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF8E8E93))),
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
                          controller: _heightController,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xFF2E3741).withOpacity(0.8),
                                  width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xFF8E8E93), width: 2),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) =>
                              BlocProvider.of<LogicBloc>(context).add(
                            UpdateHeightEvent(height: value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Border Radius row with slider and text field...
        Row(
          children: [
            const Text('Border Radius',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(width: 5),
            const Icon(Icons.info_outline, color: Color(0xFF8E8E93), size: 15),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/icons/settings_ic.svg',
                width: 16, height: 16),
          ],
        ),
        const SizedBox(height: 10),
        // Slider and text field for border radius...
        Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: SliderTheme(
                data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay),
                child: Slider(
                  value: _borderRadius,
                  min: 0.0,
                  max: 24.0,
                  divisions: 100,
                  activeColor: const Color(0xFF5E5CE6),
                  onChanged: (value) {
                    BlocProvider.of<LogicBloc>(context)
                        .add(UpdateBorderRadiusEvent(borderRadius: value.toString()));
                    setState(() {
                      _borderRadius = value;
                      _borderRadiusController.text = _borderRadius.toStringAsFixed(1);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: TextFormField(
                controller: _borderRadiusController,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: const Color(0xFF2E3741).withOpacity(0.8),
                        width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    const BorderSide(color: Color(0xFF8E8E93), width: 2),
                  ),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    double? newValue = double.tryParse(value);
                    if (newValue != null &&
                        newValue >= 0.0 &&
                        newValue <= 1.0) {
                      _borderRadius = newValue;
                    }
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Image Type Dropdown...
        Row(
          children: [
            const Text('Image Type',
                style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93))),
            const SizedBox(width: 5),
            const Icon(Icons.info_outline, color: Color(0xFF8E8E93), size: 15),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/icons/settings_ic.svg',
                width: 16, height: 16),
          ],
        ),
        const SizedBox(height: 10),
        // Dropdown button for image type...
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF2E3741).withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _imageType,
            dropdownColor: const Color(0xFF2E3741).withOpacity(0.8),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            underline: Container(height: 0, color: Colors.transparent),
            onChanged: (String? newValue) {
              setState(() {
                _imageType = newValue!;
              });
            },
            items: <String>['Network', 'Asset']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        // Import Picture button for Asset type selection
        if (_imageType == 'Asset')
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Import Picture'),
          ),

        if (_imagePath != null) Image.file(File(_imagePath!)),

        const SizedBox(height: 10),
        // Image URL input field...
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Image URL',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF8E8E93))),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/icons/settings_ic.svg',
                          width: 16, height: 16),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Image URL text field...
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // text hint for image URL...
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter Image URL',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF8E8E93)),
                            filled: true,
                            fillColor: const Color(0xFF2E3741).withOpacity(0.8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xFF2E3741).withOpacity(0.8),
                                  width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xFF8E8E93), width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Box fit icons row...
                  Row(
                    children: [
                      const Text('Box Fit',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF8E8E93))),
                      const SizedBox(width: 5),
                      const Icon(Icons.info_outline,
                          color: Color(0xFF8E8E93), size: 15),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/icons/settings_ic.svg',
                          width: 16, height: 16),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Box fit icons...
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/contain.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {},
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/cover.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {},
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/fill.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {},
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/fitWidth.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {
                            print('Face');
                          },
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/fitHeight.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {
                            print('Face');
                          },
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/none.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {
                            print('Face');
                          },
                          hoverColor: Colors.grey[700],
                        ),
                        IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.all(5),
                          icon: SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'assets/icons/scaleDown.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFF8A97A2), BlendMode.modulate),
                          ),
                          onPressed: () {
                            print('Face');
                          },
                          hoverColor: Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
