import 'dart:isolate';

import 'package:orio_attendance_app_flutter/features/attendance/domain/entity/station_entitiy.dart';

class PortParams {
  final SendPort sendPort;
  final List<Station> stations;

  PortParams(this.sendPort, this.stations);
}