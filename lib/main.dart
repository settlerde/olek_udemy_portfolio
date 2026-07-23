import 'package:flutter/material.dart';
import 'package:olek_udemy_portfolio/mobile/landing_page_mobile.dart';
import 'package:olek_udemy_portfolio/web/landing_page_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importiert deine frisch erstellte Datei

void main() async {
  // Stellt sicher, dass die Flutter-Engine bereit ist
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase mit den eben erstellten Optionen starten
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight > 800) {
            return LandingPageWeb();
          } else {
            return LandingPageMobile();
          }
        },
      ),
    );
  }
}
