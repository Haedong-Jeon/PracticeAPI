import 'package:flutter/material.dart';
import './name.dart';

class UserData extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  UserData({this.firstName, this.lastName, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Name(
          firstName: firstName,
          lastName: lastName,
        ),
        Text(
          email,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
