import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  "assets/20260416_cdemy_DSC_1377_Lebenslauf.jpg",
                ),
              ),
            ),
            SizedBox(height: 15),
            SansBold("Olek Mehl", 30),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrlString(
                      "https://console.firebase.google.com/",
                    );
                  },
                  icon: SvgPicture.asset("assets/instagram.svg", width: 30),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrlString(
                      "https://github.com/settlerde/olek_udemy_portfolio",
                    );
                  },
                  icon: SvgPicture.asset("assets/github.svg", width: 30),
                ),
              ],
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
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: "Home", route: '/'),
                  Spacer(),
                  TabsWeb(title: "Works", route: '/works'),
                  Spacer(),
                  TabsWeb(title: "Blog", route: '/blog'),
                  Spacer(),
                  TabsWeb(title: "About me", route: '/about'),
                  Spacer(),
                  TabsWeb(title: "Contact", route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              SansBold("Contact me", 30),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                        heading: "First name",
                        hintText: "Enter your first name",
                        width: 300,
                      ),
                      SizedBox(height: 15),
                      TextForm(
                        heading: "Mobile",
                        hintText: "Enter your mobile number",
                        width: 300,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextForm(
                        heading: "Last name",
                        hintText: "Enter your last name",
                        width: 300,
                      ),
                      SizedBox(height: 15),
                      TextForm(
                        heading: "E-mail",
                        hintText: "Enter your e-mail",
                        width: 300,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextForm(
                maxLines: 10,
                heading: "Message",
                hintText: "Write your messag",
                width: widthDevice / 1.6,
              ),
              SizedBox(height: 30),
              MaterialButton(
                child: SansBold("Submit", 20),
                onPressed: () {},
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                height: 60,
                minWidth: 200,
                color: Colors.blue,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
