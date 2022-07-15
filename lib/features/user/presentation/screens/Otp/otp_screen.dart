import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/body.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static String id = "otp_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpAppBar(),
      body: Body(),
    );
  }
}
