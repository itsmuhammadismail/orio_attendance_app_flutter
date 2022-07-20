import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/month_listview.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/table.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends HookWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedYear = DateTime.now();

    Future getData(int monthNo, String token) async {
      String attendanceDate = monthNo < 10
          ? '${selectedYear.year}-0$monthNo'
          : '${selectedYear.year}-$monthNo';

      await context.read<AttendanceDataCubit>().get(token, attendanceDate);
    }

    useEffect(() {
      String token = context.read<UserCubit>().state.user.token;
      getData(DateTime.now().month, token);
      return null;
    }, []);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: MyText.h2('Attendance')),
              ),
            ],
          ),
        ),
        const MonthListView(),
        const MyTable(),
      ],
    );
  }
}
