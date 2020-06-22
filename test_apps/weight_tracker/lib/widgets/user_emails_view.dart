import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/user.dart';

@framyWidget
class UserEmailsView extends StatelessWidget {
  final User user;

  const UserEmailsView({Key key, @required this.user})
      : super(key: key ?? const Key('UserEmailsView'));

  @override
  Widget build(BuildContext context) {
    if (user?.emails?.isEmpty ?? true) {
      return Text('No email');
    } else if (user.emails.length == 1) {
      return ListTile(
        title: Text('${user.emails.first}'),
        subtitle: Text('Email'),
        leading: Icon(Icons.email),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Emails:'),
          ...user.emails.map((email) => ListTile(
                title: Text('$email'),
                leading: Icon(Icons.email),
              )),
        ],
      );
    }
  }
}
