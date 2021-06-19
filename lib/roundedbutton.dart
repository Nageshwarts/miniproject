import 'package:flutter/material.dart';

class roundedbutton extends StatelessWidget {
  roundedbutton(
      {required this.onpressed, required this.colour, required this.title});

  final Color colour;
  final String title;
  Function onpressed = () {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onpressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
