import 'package:chat/login_screen.dart';
import 'package:chat/registration_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'roundedbutton.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String ids = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();
    Firebase.initializeApp();

    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logos.png'),
                    height: 30.00,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['HEALTH CARD'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            roundedbutton(
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.ids);
              },
              colour: Colors.lightBlueAccent,
              title: 'Log In',
            ),
            roundedbutton(
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.ids);
              },
              colour: Colors.blueAccent,
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
