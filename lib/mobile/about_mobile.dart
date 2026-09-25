import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/content.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: SansBold(Profile.name, 18)),
        endDrawer: const AppDrawerMobile(),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: ListView(
            children: [
              // Introduction, the first section
              CircleAvatar(
                radius: 115,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage(Profile.avatarAlt),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SectionTitle('About me'),
                    const SizedBox(height: 16),
                    Sans(
                      "Hello, I'm ${Profile.name} and I specialize in Flutter development.",
                      15,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Sans(
                      'One codebase, high performance and solid security for Android, '
                      'iOS, web and desktop.',
                      15,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        for (final skill in Profile.skills) SkillChip(skill),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Web dev, second section.
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/webL.png",
                    text: "",
                    width: 250,
                  ),
                  SizedBox(height: 20),
                  SansBold("Web development", 20),
                  SizedBox(height: 20),
                ],
              ),
              Sans(
                " I'm hier to build your presence ohline with of the art web apps.",
                15,
              ),

              // App dev, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 250,
                    text: "",
                  ),
                  SizedBox(height: 20),
                  SansBold("App development", 20),
                  SizedBox(height: 20),
                ],
              ),
              Sans(
                " You need a high-perfomance and responsive, beautiful app? Don't worry I've you covered.",
                15,
              ),

              // Backend development, fourth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 250,
                    text: "",
                  ),
                  SizedBox(height: 20),
                  SansBold("Back-end", 20),
                  SizedBox(height: 20),
                ],
              ),
              Sans(
                " Do you need your back-end highly scalable and secure? Let's have a conversation on how can I help with that.",
                15,
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
