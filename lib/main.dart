import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/routes.dart';
import 'package:olek_udemy_portfolio/theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, mode, _) {
        return MaterialApp(
          title: '${Profile.name} · ${Profile.role}',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: mode,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
