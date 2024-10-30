import 'package:compo_builder/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class TextAlignWidget extends StatelessWidget {
  final void Function(bool unselect) onTap;
  final bool isFirst;
  final bool isLast;
  final IconData iconData;
  final bool isSelected;

  const TextAlignWidget(
      {super.key,
      required this.onTap,
      this.isFirst = false,
      this.isLast = false,
      required this.iconData,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey : const Color(0xFF2E3741),
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              )
            : isLast
                ? const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )
                : BorderRadius.zero,
      ),
      child: IconButton(
        onPressed: () => onTap(isSelected),
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 16,
        ),
        padding: EdgeInsets.zero,
        splashRadius: 15,
      ),
    );
  }
}
