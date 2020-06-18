import 'package:flutter/material.dart';
import 'package:weight_tracker/models/user.dart';

import '../app_theme.dart';

class UserDataCard extends StatelessWidget {
  final User user;

  const UserDataCard({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppTheme.defaultAvatarColor,
      ),
      title: Text('${user?.firstName} ${user?.lastName}'),
      subtitle: Text('Age: ${user?.age}'),
    );
  }
}
