import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_button.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_info.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/date_time.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance/widgets/in_range_text.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/attendance_data_screen.dart';
import 'package:orio_attendance_app_flutter/resources/constants.dart';
import 'package:orio_attendance_app_flutter/shared/params/port_params.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends HookWidget {
  const Body({Key? key}) : super(key: key);

  static void runTimer(PortParams params) {
    bool isInRange = false;
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      isInRange = !isInRange;
      params.sendPort.send(isInRange);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isInRange = useState(false);
    Isolate? isolate;
    late ReceivePort receivePort;

    void start() async {
      receivePort = ReceivePort(); // Port for isolate to receive message.
      isolate = await Isolate.spawn(
          runTimer,
          PortParams(receivePort.sendPort,
              context.read<StationCubit>().state.stations));
      receivePort.listen((data) {
        isInRange.value = data;
        print(data);
      });
    }

    void stop() async {
      if (isolate != null) {
        isolate!.kill(priority: Isolate.immediate);
        isolate = null;
      }
    }

    useEffect(() {
      start();
      return () => stop();
    }, []);

    return Center(
      child: Column(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () =>
                      Navigate.to(context, AttendanceDataScreen.id),
                  icon: SvgPicture.asset('assets/icons/calender.svg')),
            ),
          ),
          const DateTimeShow(),
          const SizedBox(height: 20),
          AttendanceButton(isInRange: isInRange.value),
          const SizedBox(height: 20),
          InRangeText(isInRange: isInRange.value),
          const Expanded(child: SizedBox(height: 20)),
          const AttendanceInfo(),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
