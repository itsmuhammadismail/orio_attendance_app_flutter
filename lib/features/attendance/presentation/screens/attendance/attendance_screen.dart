import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/body.dart';
import 'package:orio_attendance_app_flutter/shared/layout/layout.dart';

class AttendanceScreen extends HookWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  static String id = "attendance_screen";

  @override
  Widget build(BuildContext context) {
    void _determinePosition() async {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    useEffect(() {
      _determinePosition();
      return null;
    }, []);

    return const Layout(
      body: Body(),
    );
  }
}
