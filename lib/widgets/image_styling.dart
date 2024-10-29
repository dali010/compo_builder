import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageStyling extends StatefulWidget {
  final int componentIndex;

  const ImageStyling({Key? key, required this.componentIndex})
      : super(key: key);

  @override
  _ImageStylingState createState() => _ImageStylingState();
}

class _ImageStylingState extends State<ImageStyling> {
  double _opacity = 0.7;
  double _borderRadius = 10.0;
  late TextEditingController _opacityController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TextEditingController _borderRadiusController;

  @override
  void initState() {
    super.initState();
    _opacityController =
        TextEditingController(text: _opacity.toStringAsFixed(1));
    _widthController = TextEditingController(text: "178");
    _heightController = TextEditingController(text: "200");
    _borderRadiusController =
        TextEditingController(text: _borderRadius.toStringAsFixed(1));
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Opacity row with slider and text field...
        Row(
          children: [
            const Text(
              'Opacity',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8E8E93),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.info_outline,
              color: Color(0xFF8E8E93),
              size: 15,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              'assets/icons/settings_ic.svg',
              width: 16,
              height: 16,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _opacity,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                activeColor: Color(0xFF5E5CE6),
                onChanged: (value) {
                  setState(() {
                    _opacity = value;
                    _opacityController.text = _opacity.toStringAsFixed(1);
                  });
                },
              ),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                controller: _opacityController,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
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
                      const Text(
                        'Width',
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _widthController,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
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
                          textAlign: TextAlign.center,
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
                      const Text(
                        'Height',
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _heightController,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
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
                          textAlign: TextAlign.center,
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
            const Text(
              'Border Radius',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8E8E93),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.info_outline,
              color: Color(0xFF8E8E93),
              size: 15,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              'assets/icons/settings_ic.svg',
              width: 16,
              height: 16,
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Slider and text field for border radius...
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _borderRadius,
                min: 0.0,
                max: 50.0,
                divisions: 100,
                activeColor: Color(0xFF5E5CE6),
                onChanged: (value) {
                  setState(() {
                    _borderRadius = value;
                    _borderRadiusController.text =
                        _borderRadius.toStringAsFixed(1);
                  });
                },
              ),
            ),
            SizedBox(
              width: 50,
              child: TextFormField(
                controller: _borderRadiusController,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
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
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    double? newValue = double.tryParse(value);
                    if (newValue != null &&
                        newValue >= 0.0 &&
                        newValue <= 50.0) {
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
            const Text(
              'Image Type',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8E8E93),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.info_outline,
              color: Color(0xFF8E8E93),
              size: 15,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(
              'assets/icons/settings_ic.svg',
              width: 16,
              height: 16,
            ),
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
            value: 'Network',
            dropdownColor: const Color(0xFF2E3741).withOpacity(0.8),
            icon: SvgPicture.asset(
              'assets/icons/dropdown_ic.svg',
              width: 16,
              height: 16,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                // _imageType = newValue!;
              });
            },
            items: <String>['Network', 'Asset', 'File']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
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
                      const Text(
                        'Image URL',
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
                  const SizedBox(height: 5),
                  // Image URL text field...
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // text hint for image URL...
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Image URL',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8E8E93),
                            ),
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Box fit icons row...
                  Row(
                    children: [
                      const Text(
                        'Box Fit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF8E8E93),
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        'assets/icons/settings_ic.svg',
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Box fit icons...
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.crop_square,
                                  color: Colors.grey[300]),
                              onPressed: () {},
                              hoverColor: Colors.grey[700],
                              padding: EdgeInsets.all(8),
                            ),
                            IconButton(
                              icon: Icon(Icons.square_outlined,
                                  color: Colors.grey[300]),
                              onPressed: () {},
                              hoverColor: Colors.grey[700],
                              padding: EdgeInsets.all(8),
                            ),
                            IconButton(
                              icon: Icon(Icons.square_outlined,
                                  color: Colors.grey[300]),
                              onPressed: () {},
                              hoverColor: Colors.grey[700],
                              padding: EdgeInsets.all(8),
                            ),
                            IconButton(
                              icon: Icon(Icons.face, color: Colors.grey[300]),
                              onPressed: () {
                                print('Face');
                              },
                              hoverColor: Colors.grey[700],
                              padding: EdgeInsets.all(8),
                            ),
                          ],
                        ),
                      )
                    ],
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
