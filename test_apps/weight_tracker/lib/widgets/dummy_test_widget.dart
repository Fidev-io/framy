import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/dummy_test_widget_model.dart';

// This is dummy widget that is used for testing that Framy App will work
// with widgets that are using models not annotated with FramyModel
@FramyWidget(groupName: 'Dummy Widgets')
class DummyTestWidget extends StatelessWidget {
  final DummyTestWidgetModel model;

  const DummyTestWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('This is dummy widget used only to test: ${model?.text}');
  }
}
