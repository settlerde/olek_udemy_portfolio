import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/mobile/about_mobile.dart';
import 'package:olek_udemy_portfolio/mobile/contact_mobile.dart';
import 'package:olek_udemy_portfolio/mobile/landing_page_mobile.dart';
import 'package:olek_udemy_portfolio/web/about_web.dart';
import 'package:olek_udemy_portfolio/web/contact_web.dart';
import 'package:olek_udemy_portfolio/web/landing_page_web.dart';

/// Width at which the desktop layout replaces the mobile one.
const double kDesktopBreakpoint = 800;

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/contact':
        return _adaptive(settings, const ContactWeb(), const ContactMobile());
      case '/about':
        return _adaptive(settings, const AboutWeb(), const AboutMobile());
      default:
        return _adaptive(
          settings,
          const LandingPageWeb(),
          const LandingPageMobile(),
        );
    }
  }

  static MaterialPageRoute<dynamic> _adaptive(
    RouteSettings settings,
    Widget web,
    Widget mobile,
  ) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (context) => LayoutBuilder(
        builder: (context, constraints) =>
            constraints.maxWidth > kDesktopBreakpoint ? web : mobile,
      ),
    );
  }
}
