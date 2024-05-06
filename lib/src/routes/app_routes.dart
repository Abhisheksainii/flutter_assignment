import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/bottom_nav.dart';
import 'package:flutter_assignment/src/features/home/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum Routes {
  home,
  navbar,
}

extension RoutesX on Routes {
  String get path {
    switch (this) {
      case Routes.home:
        return "${Routes.navbar.path}/home";
      case Routes.navbar:
        return "/navbar";
    }
  }
}

final goRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.navbar.path,
    routes: [
      GoRoute(
        name: "navbar",
        path: "/navbar",
        builder: (context, state) => const CustomBottomNavbar(),
        routes: [
          GoRoute(
            name: "home",
            path: "home",
            builder: (context, state) => HomePage(),
          ),
        ],
      ),
    ],
  ),
);
