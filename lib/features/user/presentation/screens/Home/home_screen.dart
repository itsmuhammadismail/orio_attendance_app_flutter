import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/widgets/body.dart';
import 'package:orio_attendance_app_flutter/shared/layout/layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 1,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
