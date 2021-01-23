import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  final String firstName;
  final String lastName;
  Name({this.firstName, this.lastName});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          firstName,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          lastName,
        ),
      ],
    );
  }
}
