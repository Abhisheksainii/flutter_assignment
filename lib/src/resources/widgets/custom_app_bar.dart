import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_assignment/src/resources/widgets/icon__number_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.showtrailingIcon,
    this.leadingIcon,
  });
  final Widget? leadingIcon;
  final String text1;
  final String text2;
  final String text3;
  final bool showtrailingIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          text: text1,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: text2,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: text3,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      leading: leadingIcon,
      actions: [
        const IconNumberContainer(
          iconPath: "assets/icons/star.svg",
          number: "323,233",
        ),
        if (showtrailingIcon)
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/bell.svg", width: 40),
          )
      ],
    );
  }
}
