import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/resources/constants/colors.dart';
import 'package:flutter_assignment/src/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRoutes = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: "Luvit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Kcolors.primary),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Kcolors.primary,
        ),
        scaffoldBackgroundColor: Kcolors.primary,
        useMaterial3: true,
      ),
      routerConfig: appRoutes,
    );
  }
}
