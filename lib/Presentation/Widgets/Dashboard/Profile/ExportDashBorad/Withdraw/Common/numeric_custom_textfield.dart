import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class NumericCustomTextfield extends StatelessWidget {
  const NumericCustomTextfield({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.circularStdRegular(
        context,
        fontSize: 30,
      ),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: '0.00',
        hintStyle: Styles.circularStdRegular(
          context,
          fontSize: 30,
        ),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        RegExp regex =
            RegExp(r'[^\d.]|(\.)(?=.*\.)|(?<=\.\d{2})\.|(?<=\.\d)\d+');
        controller.text = controller.text.trim().replaceAll(regex, '');
        log(controller.text);
      },
    );
  }
}
