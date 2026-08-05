import 'package:flutter/material.dart';
import 'package:olek_udemy_portfolio/mobile/about_mobile.dart';
import 'package:olek_udemy_portfolio/mobile/contact_mobile.dart';
import 'package:olek_udemy_portfolio/mobile/landing_page_mobile.dart';
import 'package:olek_udemy_portfolio/web/about_web.dart';
import 'package:olek_udemy_portfolio/web/contact_web.dart';
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
      case '/contact':
        return MaterialPageRoute(
          builder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return ContactWeb();
              } else
                return ContactMobile();
            },
          ),
          settings: settings,
        );
      case '/about':
        return MaterialPageRoute(
          builder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return AboutWeb();
              } else {
                return AboutMobile();
              }
            },
          ),
          settings: settings,
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
