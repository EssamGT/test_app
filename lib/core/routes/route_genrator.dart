
import 'package:flutter/material.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/features/main_page/presentation/main_screen.dart';
import 'package:test_app/features/order_settings_screen/presentation/settings_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
  
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('No Route Found')),
            body: const Center(child: Text('No Route Found')),
          ),
    );
  }
}
