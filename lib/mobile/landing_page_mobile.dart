import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LandingPageMobile extends StatefulWidget {
  final text;
  const LandingPageMobile({super.key, required this.text});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  double? heightDevice;

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

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.blue,
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
      body: ListView(
        children: [
          // intro first section
          Padding(
            padding: const EdgeInsetsGeometry.only(left: 15),
            child: CircleAvatar(
              radius: 115,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage(
                  "assets/20260416_cdemy_DSC_1378_Lebenslauf.jpg",
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SansBold("Hello I'm", 15),
              ),
              SansBold("Olek Mehl", 30),
              Sans("Flutter developer", 20),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 3,
                children: [
                  Icon(Icons.email),
                  Icon(Icons.call),
                  Icon(Icons.location_pin),
                ],
              ),
              SizedBox(width: 20),
              Wrap(
                direction: Axis.vertical,
                spacing: 9,
                children: [
                  Sans("olekmehl@gmail.com", 15),
                  Sans("123456789", 15),
                  Sans("Vellmar 34246", 15),
                ],
              ),
            ],
          ),
          SizedBox(height: 90),

          // About me second section
          Padding(
            padding: EdgeInsetsGeometry.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold("About me", 30),
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
          SizedBox(height: 50),

          // third section _ What I do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I do?", 30),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web development",
                width: 200,
                height: 150,
              ),
              SizedBox(height: 30),
              AnimatedCard(
                imagePath: "assets/firebase.png",
                text: "Backend development",
                width: 200,
                height: 150,
              ),
              SizedBox(height: 30),
              AnimatedCard(
                imagePath: "assets/app.png",
                text: "App development",
                width: 200,
                height: 150,
              ),
            ],
          ),
          SizedBox(height: 30),

          // Forth section _ Contact
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20,
            spacing: 20,
            children: [
              SansBold("Contact me", 30),
              Container(
                height: heightDevice,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextForm(
                      width: widthDevice / 1.4,
                      heading: "First name",
                      hintText: "Please type your first name",
                      maxLines: 1,
                    ),
                    SizedBox(height: 15),
                    TextForm(
                      heading: "Last name",
                      hintText: "Please type your last name",
                      width: widthDevice / 1.4,
                    ),
                    SizedBox(height: 15),
                    TextForm(
                      heading: "Phone number",
                      hintText: "Please enter your phone number",
                      width: widthDevice / 1.4,
                    ),
                    SizedBox(height: 15),
                    TextForm(
                      heading: "Email",
                      hintText: "Enter your Email",
                      width: widthDevice / 1.4,
                    ),
                    SizedBox(height: 15),
                    TextForm(
                      heading: "Message",
                      hintText: "Write your message",
                      width: widthDevice / 1.4,
                      maxLines: 5,
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      child: SansBold("Submit", 21),
                      onPressed: () {},
                      elevation: 20.0,
                      color: Colors.blue,
                      height: 50,
                      minWidth: 150,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
