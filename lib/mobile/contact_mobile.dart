import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/contact_form.dart';
import 'package:olek_udemy_portfolio/content.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: const AppDrawerMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Theme.of(context).colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              const SectionTitle('Contact me'),
              const SizedBox(height: 24),
              ContactForm(fieldWidth: deviceWidth / 1.2, twoColumns: false),
              const SizedBox(height: 24),
              const SocialLinks(
                instagramUrl: Profile.instagram,
                githubUrl: Profile.github,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
