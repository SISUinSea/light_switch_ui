import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final primaryColorLight = const Color(0xFFD8E0ED);
  final primaryColorDark = const Color(0xFF2E3243);

  var isPressed = false;
  var isDark = false;

  Widget dayNight() {
    return Container(
      width: 210,
      height: 210,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: isDark
                  ? [Color(0xFF30218F), Color(0xFF8D81DD)]
                  : [Color(0xFFFFCC81), Color(0xFFFF6E30)])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? primaryColorDark : primaryColorLight,
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              dayNight(),
            ]),
      ),
    );
  }
}
