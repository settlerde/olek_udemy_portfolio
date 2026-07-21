import 'package:flutter/material.dart';
import 'package:olek_udemy_portfolio/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0),
        title: Row(
          children: [
            Spacer(flex: 2),
            TabsWeb('Home'),
            Spacer(),
            TabsWeb('Works'),
            Spacer(),
            TabsWeb('Blog'),
            Spacer(),
            TabsWeb('About'),
            Spacer(),
            TabsWeb('Contact'),
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
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SansBold("Hello I'm", 15),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold("About me", 32),
                SizedBox(height: 15),
                Sans("Hi! I'm Olek Mehl,", 21),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
