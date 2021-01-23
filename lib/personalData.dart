import 'package:flutter/material.dart';
import './userData.dart';

class PersonalData extends StatelessWidget {
  final String imgURL;
  final String firstName;
  final String lastName;
  final String email;
  PersonalData({this.firstName, this.lastName, this.email, this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              imgURL,
            ),
          ),
          title: UserData(
            email: email,
            firstName: firstName,
            lastName: lastName,
          ),
        ),
      ),
    );
  }
}
