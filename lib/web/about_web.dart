import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    urlLauncher(String imgPath, String url) {
      return IconButton(
        icon: SvgPicture.asset(imgPath, width: 32),
        onPressed: () {
          launchUrl(Uri.parse(url));
        },
      );
    }

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

    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hier begint den Button Code
            MaterialButton(
              onPressed: () {
                context.go("/mobile");
              },
              color: Colors.blue,
              child: Text("Go to..."),
            ),
            SizedBox(height: 15),
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  "assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg",
                ),
              ),
            ),
            SizedBox(height: 15),
            SansBold("Olek Mehl", 32),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher(
                  "assets/instagram.svg",
                  'https://www.instagram.com/accounts/login/',
                ),
                urlLauncher(
                  "assets/github.svg",
                  "https://github.com/settlerde",
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 21.0),
        title: Row(
          children: [
            Spacer(flex: 2),
            TabsWeb(title: 'Home', route: '/'),
            Spacer(),
            TabsWeb(title: 'Works', route: '/works'),
            Spacer(),
            TabsWeb(title: 'Blog', route: '/blog'),
            Spacer(),
            TabsWeb(title: 'About me', route: '/about'),
            Spacer(),
            TabsWeb(title: 'Contact me', route: '/contact'),
            Spacer(),
          ],
        ),
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
                    Row(
                      children: [
                        blueContainer("Flutter"),
                        SizedBox(width: 15),
                        blueContainer("Android"),
                        SizedBox(width: 15),
                        blueContainer("Ios"),
                        SizedBox(width: 15),
                        blueContainer("Windows"),
                        SizedBox(width: 15),
                        blueContainer("Firebase"),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 143,
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: AssetImage(
                      'assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg',
                    ),
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
