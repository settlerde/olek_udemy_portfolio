import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/contact_form.dart';
import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/theme.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 68,
                backgroundImage: AssetImage(Profile.avatar),
              ),
            ),
            const SizedBox(height: 16),
            SansBold(Profile.name, 28),
            const SizedBox(height: 16),
            const SocialLinks(
              instagramUrl: Profile.instagram,
              githubUrl: Profile.github,
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 475,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: SansBold(Profile.name, 20, color: Colors.white),
              actions: const [
                TabsWeb(title: 'Home', route: '/'),
                SizedBox(width: 8),
                TabsWeb(title: 'About me', route: '/about'),
                SizedBox(width: 8),
                TabsWeb(title: 'Contact', route: '/contact'),
                SizedBox(width: 8),
                ThemeToggleButton(),
                SizedBox(width: 16),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            children: [
              const SectionTitle(
                'Contact me',
                subtitle:
                    'Tell me about your project and I will get back to you within a day.',
              ),
              const SizedBox(height: 32),
              ContactForm(
                fieldWidth: widthDevice > 900 ? 380 : widthDevice / 1.4,
                twoColumns: widthDevice > 900,
              ),
              const SizedBox(height: 32),
              const SocialLinks(
                instagramUrl: Profile.instagram,
                githubUrl: Profile.github,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
