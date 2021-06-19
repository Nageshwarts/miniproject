import 'package:chat/constants.dart';
import 'package:chat/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'patient_details.dart';

class patient extends StatelessWidget {
  static String ids = 'patient';
  late String data;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("PATIENT"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    "CHECK PRSECRIPTION",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.00),
                  ),
                  SizedBox(
                    height: 10.00,
                  ),
                  TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        data = value;
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
                    title: 'check',
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
