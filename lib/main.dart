import 'package:chat/intial_role.dart';
import 'package:flutter/material.dart';
import 'role.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'chat_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: intial.ids,
      routes: {
        WelcomeScreen.ids: (context) => WelcomeScreen(),
        RegistrationScreen.ids: (context) => RegistrationScreen(),
        LoginScreen.ids: (context) => LoginScreen(),
        ChatScreen.ids: (context) => ChatScreen(),
        role.ids: (context) => role(),
        intial.ids: (context) => intial(),
      },
    );
  }
}
