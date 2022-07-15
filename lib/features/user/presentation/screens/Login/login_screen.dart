import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
