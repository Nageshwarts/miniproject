import 'package:chat/constants.dart';
import 'package:chat/roundedbutton.dart';
import 'package:flutter/material.dart';

class details extends StatelessWidget {
  static String ids = 'patient_details';
  late int data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DETAILS'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  data = value as int;
                },
                decoration: kinputdecoration.copyWith(
                    hintText: 'enter the adhar number')),
            SizedBox(
              height: 8.0,
            ),
            roundedbutton(
              onpressed: () {
                Navigator.pushNamed(context, details.ids);
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
