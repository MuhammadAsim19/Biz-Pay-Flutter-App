import 'package:flutter/cupertino.dart';

class CheckBoxController {
  static ValueNotifier<List<Map<String, dynamic>>> checkBoxNotifier =
      ValueNotifier([
    {"Building": false},
    {"Property": false},
    {"Equipment": false},
    {"Contracts": false}
  ]);
}
