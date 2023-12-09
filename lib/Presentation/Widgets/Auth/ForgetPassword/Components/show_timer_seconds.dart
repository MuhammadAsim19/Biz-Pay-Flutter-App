import 'dart:async';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ShowTimerText extends StatefulWidget {
  const ShowTimerText({super.key, required this.onComplate});

  final void Function(int? time, Timer timer) onComplate;

  @override
  State<ShowTimerText> createState() => _ShowTimerTextState();
}

class _ShowTimerTextState extends State<ShowTimerText> {
  int time = 90;
  Timer? timer1;

  setTimer() {
    timer1 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time < 1) {
        widget.onComplate(time, timer1!);
        timer.cancel();
      } else {
        time--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer1!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    setTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppText(
        "Resend OTP in 00:${time.toString()}",
        style: Styles.circularStdRegular(context,
            fontSize: 14.sp, color: AppColors.greyLightColor),
        maxLine: 2,
      ),
    );
  }
}
