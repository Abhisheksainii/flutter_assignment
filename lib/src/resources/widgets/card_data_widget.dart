import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';

class CardDataWidgetContainer extends StatelessWidget {
  const CardDataWidgetContainer({
    super.key,
    required this.text,
    this.color = Kcolors.primary,
    this.showIcon = true,
    this.emoji = "",
  });
  final String emoji;
  final String text;
  final Color color;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: color != Kcolors.primary ? color.withOpacity(0.3) : color,
        border: color != Kcolors.primary
            ? null
            : Border.all(
                color: Kcolors.borderColor,
              ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (showIcon)
            Text(
              emoji,
            ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: color != Kcolors.primary ? color : Colors.white),
          ),
        ],
      ),
    );
  }
}
