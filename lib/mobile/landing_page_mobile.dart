import 'package:flutter/material.dart';

class LandingPageMobile extends StatefulWidget {
  final text;
  const LandingPageMobile({super.key, required this.text});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
          ],
        ),
      ),
    );
  }
}
