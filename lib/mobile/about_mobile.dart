import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    blueContainer(String text) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        child: Text(text, style: GoogleFonts.openSans(fontSize: 15)),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35),
        ),
        endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.blue),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg",
                    ),
                  ),
                ),
                padding: EdgeInsetsGeometry.only(bottom: 20),
              ),
              TabsMobile(text: "Home", route: '/'),
              SizedBox(height: 15),
              TabsMobile(text: "Works", route: '/works'),
              SizedBox(height: 15),
              TabsMobile(text: "Blog", route: '/blog'),
              SizedBox(height: 15),
              TabsMobile(text: "About", route: '/about'),
              SizedBox(height: 15),
              TabsMobile(text: "Contact", route: '/contact'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await launchUrlString("https://www.instagram.com/");
                    },
                    icon: SvgPicture.asset("assets/instagram.svg", height: 35),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrlString("https://github.com/repos");
                    },
                    icon: SvgPicture.asset("assets/github.svg", height: 35),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: ListView(
            children: [
              // Introduction, the first section
              CircleAvatar(
                radius: 115,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage(
                    "assets/20260416_cdemy_DSC_1378_Lebenslauf.jpg",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 30),
                    SizedBox(height: 15),
                    Sans(
                      " Hello, I'm Olek Mehl and I specialize in Flutter development",
                      15,
                    ),
                    Sans(
                      "bla bla bla und bla bla bla and bla bla bla oder bla bla bla no problem! \n",
                      15,
                    ),
                    Sans(
                      "...secutity for Android, Ios, Web, Mac, Linux, and you",
                      15,
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 12,
                      children: [
                        blueContainer("Flutter"),
                        blueContainer("Firebase"),
                        blueContainer("Android"),
                        blueContainer("Windows"),
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
