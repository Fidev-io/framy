import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/widgets/user_data_card.dart';
import 'package:weight_tracker/widgets/user_emails_view.dart';
import 'package:weight_tracker/widgets/weight_unit_display.dart';

@FramyUseProvider(User)
@FramyWidget(isPage: true)
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Column(
          children: [
            UserDataCard(user: user),
            UserEmailsView(user: user),
            WeightUnitDisplay(),
          ],
        );
      },
    );
  }
}
