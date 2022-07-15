import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/notification/presentation/screen/widgets/body.dart';
import 'package:orio_attendance_app_flutter/shared/layout/layout.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String id = "notification_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 3,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
