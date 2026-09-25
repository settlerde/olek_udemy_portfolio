import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/theme.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
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
      appBar: AppBar(
        title: SansBold(Profile.name, 20),
        actions: const [
          TabsWeb(title: 'Home', route: '/'),
          SizedBox(width: 8),
          TabsWeb(title: 'About me', route: '/about'),
          SizedBox(width: 8),
          TabsWeb(title: 'Contact me', route: '/contact'),
          SizedBox(width: 8),
          ThemeToggleButton(),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          // About me first section
          SizedBox(
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 30),
                    SizedBox(height: 15),
                    Sans(
                      "Hello! I'm Oleksii I specialize in flutter development.",
                      15,
                    ),
                    Sans(
                      "I strive to insure astounding performance with state of",
                      15,
                    ),
                    Sans(
                      "art security for Android, Ios, Web, Linux, Windows.",
                      15,
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 520,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (final skill in Profile.skills) SkillChip(skill),
                        ],
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 143,
                  child: const CircleAvatar(
                    radius: 138,
                    backgroundImage: AssetImage(Profile.avatar),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          // Web development, second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(imagePath: "assets/webL.png", text: "", width: 250),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Web development", 30),
                    SizedBox(height: 15),
                    Sans(
                      " I'm hier to build your presence ohline with of the art web apps.",
                      15,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
