import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final primaryColorLight = const Color(0xFFD8E0ED);
  final primaryColorDark = const Color(0xFF2E3243);

  bool isPressed = false;
  bool isDark = false;

  Widget sunAndMoon() {
    final double position = isDark ? -36 : -180;
    return Stack(
      children: [
        Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? [Color(0xFF30218F), Color(0xFF8D81DD)]
                      : [Color(0xFFFFCC81), Color(0xFFFF6E30)])),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          top: position,
          right: position,
          child: Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? primaryColorDark : primaryColorLight),
          ),
        )
      ],
    );
  }

  Widget centerText() {
    return Text(
      isDark ? 'Good\nNight' : 'Good\nMorning',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 44,
          fontFamily: 'Montserrat',
          color: isDark ? primaryColorLight : primaryColorDark),
    );
  }

  Widget powerButton() {
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
        isDark = !isDark;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light));
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? primaryColorDark : primaryColorLight,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: isDark
                      ? const Color(0xFF121625)
                      : const Color(0xFFA5B7D6),
                  blurRadius: 5.0,
                  spreadRadius: 2.5,
                  inset: isPressed),
              BoxShadow(
                  offset: Offset(0, -5),
                  color: isDark ? Color(0x4D9DA7CF) : Colors.white70,
                  blurRadius: 5.0,
                  spreadRadius: 2.5,
                  inset: isPressed)
            ]),
        child: Icon(
          Icons.power_settings_new,
          size: 72,
          color: isDark ? primaryColorLight : primaryColorDark,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? primaryColorDark : primaryColorLight,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sunAndMoon(),
            const SizedBox(height: 36),
            centerText(),
            const SizedBox(height: 180),
            powerButton()
          ],
        ),
      ),
    );
  }
}
