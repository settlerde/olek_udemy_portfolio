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
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
                Image.asset('web.jpg', height: heightDevice / 2.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 32),
                    SizedBox(height: 15),
                    Sans(
                      "Hi! I'm Olek Mehl I specialize in Flutter wich runs its Apps on all platforms.,",
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
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCardWeb(
                      imagePath: "web.jpg",
                      text: "Web development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCardWeb(
                      imagePath: "app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: false,
                    ),
                    AnimatedCardWeb(
                      imagePath: "firebase.png",
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
