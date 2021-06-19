import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'prescription.dart';

class doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("doctor"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: WavyAnimatedTextKit(
                text: ['SELECT THE TYPE OF PATIENT'],
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      elevation: 10.00,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      textStyle:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    onPressed: () {
                      print('button add prescrption pressed');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => prescription()));
                    },
                    child: Text('NEW PATIENT'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      elevation: 10.00,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      textStyle:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    onPressed: () {},
                    child: Text('EXISTING PATIENT'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
