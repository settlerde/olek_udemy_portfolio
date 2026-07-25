import 'package:flutter/material.dart';
import 'package:olek_udemy_portfolio/mobile/landing_page_mobile.dart';
import 'package:olek_udemy_portfolio/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile(text: "Mobile");
              }
            },
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else {
                return LandingPageMobile(text: "Mobile");
              }
            },
          ),
        );
    }
  }
}
