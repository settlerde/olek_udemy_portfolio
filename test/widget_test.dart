import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:olek_udemy_portfolio/contact_form.dart';
import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/main.dart';
import 'package:olek_udemy_portfolio/theme.dart';

void main() {
  testWidgets('landing page shows the profile intro', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text(Profile.name), findsWidgets);
    expect(find.text(Profile.role), findsWidgets);
  });

  testWidgets('theme toggle switches between light and dark', (tester) async {
    addTearDown(() => themeController.value = ThemeMode.light);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: const Scaffold(body: Center(child: ThemeToggleButton())),
      ),
    );

    expect(themeController.value, ThemeMode.light);
    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(themeController.value, ThemeMode.dark);
  });

  testWidgets('contact form rejects an empty submit', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: ContactForm(fieldWidth: 300, twoColumns: false),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Send message'));
    await tester.pump();

    expect(find.text('First name is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Message is required'), findsOneWidget);
  });

  testWidgets('contact form rejects a malformed email', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: ContactForm(fieldWidth: 300, twoColumns: false),
          ),
        ),
      ),
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, 'name@example.com'),
      'not-an-email',
    );
    await tester.tap(find.text('Send message'));
    await tester.pump();

    expect(find.text('Please enter a valid email address'), findsOneWidget);
  });
}
