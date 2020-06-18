import 'package:flutter/material.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/widgets/user_data_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = User('John', 'Doe', 23);
    return Column(
      children: [
        UserDataCard(user: user),
      ],
    );
  }
}
