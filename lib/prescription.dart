import 'package:chat/constants.dart';
import 'package:chat/roundedbutton.dart';
import 'package:flutter/material.dart';

class prescription extends StatelessWidget {
  static String ids = 'prsecription';
  late int adhars;
  late String disease;
  late String name;
  late String medication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRESCRIPTION'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  adhars = value as int;
                },
                decoration: kinputdecoration.copyWith(
                    hintText: 'enter the adhar number')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: kinputdecoration.copyWith(
                    hintText: 'enter the patient name')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  disease = value;
                },
                decoration:
                    kinputdecoration.copyWith(hintText: 'enter the disease')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  medication = value;
                },
                decoration: kinputdecoration.copyWith(
                    hintText: 'enter the  medication')),
            SizedBox(
              height: 8.0,
            ),
            roundedbutton(
              onpressed: () {
                Navigator.pushNamed(context, prescription.ids);
              },
              colour: Colors.lightBlueAccent,
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
