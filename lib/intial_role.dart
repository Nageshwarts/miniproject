import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'welcome_screen.dart';

class intial extends StatefulWidget {
  static String ids = 'intial_screen';

  @override
  _intialState createState() => _intialState();
}

class _intialState extends State<intial> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'HEALTH CARD',
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: WavyAnimatedTextKit(
                text: ['SELECT YOUR ROLE'],
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 150.00, right: 150.00, top: 60.00),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    elevation: 30.00,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    textStyle:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  child: Text('DOCTOR',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    print('button 1 pressed');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));

                    // Navigate to second route when tapped.
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 150.00, right: 150.00, bottom: 100.00),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    elevation: 30.00,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    textStyle:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  child: Text(
                    'PATIENT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    print('button 2 pressed');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));

                    // Navigate to second route when tapped.
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
