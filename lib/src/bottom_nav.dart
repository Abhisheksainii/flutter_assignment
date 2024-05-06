import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_assignment/src/features/home/presentation/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Kcolors.primary, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      navBarHeight: 80,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  PersistentBottomNavBarItem _navBarItem({
    required String iconPath,
    required String title,
  }) =>
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          iconPath,
        ),
        textStyle: const TextStyle(fontSize: 12),
        title: title,
        inactiveIcon: SvgPicture.asset(
          iconPath,
        ),
        activeColorPrimary: Kcolors.darkPink,
        inactiveColorPrimary: Kcolors.shadyBlack,
      );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _navBarItem(iconPath: "assets/icons/home.svg", title: "홈"),
      _navBarItem(iconPath: "assets/icons/location.svg", title: "스팟"),
      _navBarItem(iconPath: "assets/icons/like.svg", title: ""),
      _navBarItem(iconPath: "assets/icons/messages.svg", title: "채팅"),
      _navBarItem(iconPath: "assets/icons/profile.svg", title: "마이"),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
  }
}
