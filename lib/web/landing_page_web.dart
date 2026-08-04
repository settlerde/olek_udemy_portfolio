import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imgPath, width: 32),
      onPressed: () {
        launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPageMobile()),
                // );
                // Navigator.of(context).pushNamed('/mobile');
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
          // First page
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SansBold("Hello I'm", 21),
                    ),
                    SizedBox(height: 15),
                    Sans("Olek Mehl", 55),
                    Sans("Flutter developer", 32),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans("olekmehl@gmail.com", 21),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans("+49 176 236 76 121", 21),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans("18, Beethovenstr, Vellmar", 21),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsetsGeometry.all(50)),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 103,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      'assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/web.jpg', height: heightDevice / 1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 32),
                    SizedBox(height: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsetsGeometry.only(right: 15)),
                        Sans(
                          "Hi! I'm Olek Mehl I specialize in Flutter wich runs its Apps on all platforms.",
                          21,
                        ),

                        Sans(
                          "I would write for your business or you a personal App as well as a website,",
                          21,
                        ),
                        Sans(
                          "so it's gonna be not only nice and functional, but safe.",
                          21,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Sans("Flutter", 21),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Sans("Firebase", 21),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Sans("Android", 21),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Sans("Ios", 21),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Sans("Windows", 21),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Third page
          Container(
            height: heightDevice / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I do?", 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/web.jpg",
                      text: "Web development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: false,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Forth page
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact me", 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          width: 350,
                          heading: "First name",
                          hintText: "Please type your first name",
                          maxLines: 1,
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          heading: "Email",
                          hintText: "Enter your Email",
                          width: 350,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          heading: "Last name",
                          hintText: "Please type your last name",
                          width: 350,
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          heading: "Phone number",
                          hintText: "Please enter your phone number",
                          width: 350,
                        ),
                      ],
                    ),
                  ],
                ),
                TextForm(
                  heading: "Message",
                  hintText: "Write your message",
                  width: widthDevice / 1.5,
                  maxLines: 10,
                ),
                MaterialButton(
                  child: SansBold("Submit", 21),
                  onPressed: () {},
                  elevation: 20.0,
                  color: Colors.blue,
                  height: 60,
                  minWidth: 200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
