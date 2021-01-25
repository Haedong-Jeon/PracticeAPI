import 'package:PracticeAPI/detail_page.dart';
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
    Map<String, String> args = {
      'title': '$firstName $lastName',
      'imageUrl': imgURL,
    };
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailPage.routeName,
          arguments: args,
        );
      },
      child: Container(
        height: 100,
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: Hero(
              tag: '$firstName $lastName',
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  imgURL,
                ),
              ),
            ),
            title: UserData(
              email: email,
              firstName: firstName,
              lastName: lastName,
            ),
          ),
        ),
      ),
    );
  }
}
