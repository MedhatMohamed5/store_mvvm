import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/theme/theme_manager.dart';
import 'package:store_mvvm/presentation/routes/routes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      theme: ThemeManager.getAppTheme(),
    );
  }
}
