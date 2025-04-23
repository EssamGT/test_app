import 'package:flutter/material.dart';
import 'package:test_app/core/di/di.dart';
import 'package:test_app/core/res/theme_manager.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/routes/route_genrator.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
     onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.main,
    );
  }
}
