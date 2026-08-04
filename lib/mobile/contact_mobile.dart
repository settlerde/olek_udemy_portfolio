import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olek_udemy_portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.blue,
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
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 15,
            children: [
              SansBold("Contact me", 30),
              SizedBox(height: 15),
              TextForm(
                heading: "First name",
                hintText: "Write your first name",
                width: deviceWidth / 1.4,
              ),
              SizedBox(height: 15),
              TextForm(
                heading: "Last name",
                hintText: "Write your last name",
                width: deviceWidth / 1.4,
              ),
              SizedBox(height: 15),
              TextForm(
                heading: "Phone",
                hintText: "Write your phone number",
                width: deviceWidth / 1.4,
              ),
              SizedBox(height: 15),
              TextForm(
                heading: "Email",
                hintText: "Write your Email address",
                width: deviceWidth / 1.4,
              ),
              SizedBox(height: 15),
              TextForm(
                heading: "Message",
                hintText: "Write me a message",
                width: deviceWidth / 1.4,
                maxLines: 10,
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                height: 50,
                minWidth: deviceWidth / 2.5,
                color: Colors.blue,
                child: SansBold("Submit", 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
