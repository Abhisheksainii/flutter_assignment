import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class IconNumberContainer extends StatelessWidget {
  const IconNumberContainer({
    super.key,
    required this.iconPath,
    required this.number,
  });
  final String iconPath;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        color: Kcolors.primary,
        border: Border.all(
          color: Kcolors.borderColor,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(iconPath, width: 18),
          Text(
            number,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
