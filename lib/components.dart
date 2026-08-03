import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({this.title, this.route, super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
          // print('Enter');
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
          // print('Exit');
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(microseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.oswald(
                  color: Colors.transparent,
                  shadows: [Shadow(color: Colors.white, offset: Offset(0, -5))],
                  fontSize: 25.0,
                )
              : GoogleFonts.oswald(fontSize: 21.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      height: 50,
      minWidth: 200,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final int? maxLines;
  final hintText;
  const TextForm({
    super.key,
    required this.heading,
    required this.hintText,
    this.maxLines,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(heading, 21),
        SizedBox(height: 5),
        SizedBox(
          width: width,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(500),
              FilteringTextInputFormatter.allow(RegExp('[a-z A-Z0-9]')),
            ],
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final BoxFit? fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard({
    super.key,
    this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(vsync: this);
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
          side: BorderSide(color: Colors.blue),
        ),
        shadowColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200,
                width: widget.width ?? 200,
              ),
              SizedBox(height: 10),
              SansBold(widget.text, 15),
            ],
          ),
        ),
      ),
    );
  }
}
