import 'package:compo_builder/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class FontStyling extends StatelessWidget {
  final void Function(bool unselect) onTap;
  final bool isFirst;
  final FontStyles fontStyle;
  final bool isSelected;

  const FontStyling(
      {super.key,
      required this.onTap,
      this.isFirst = false,
      required this.fontStyle,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 40,
      child: ElevatedButton(
        onPressed: () => onTap(isSelected),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: isSelected ? Colors.grey : const Color(0xFF2E3741),
          shape: RoundedRectangleBorder(
            borderRadius: fontStyle == FontStyles.underline
                ? BorderRadius.zero
                : isFirst
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
          ),
        ),
        child: _getIcon(fontStyle),
      ),
    );
  }

  Icon? _getIcon(FontStyles style) {
    switch (style) {
      case FontStyles.italic:
        return const Icon(
          Icons.format_italic,
          color: Colors.white,
        );
      case FontStyles.underline:
        return const Icon(
          Icons.format_underline,
          color: Colors.white,
        );
      case FontStyles.lineThrough:
        return const Icon(
          Icons.format_strikethrough,
          color: Colors.white,
        );
      default:
        return null;
    }
  }
}
