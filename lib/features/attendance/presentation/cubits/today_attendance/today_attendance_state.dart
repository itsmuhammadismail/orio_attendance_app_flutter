// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'today_attendance_cubit.dart';

class TodayAttendanceState extends Equatable {
  final AttendanceData attendanceData;

  const TodayAttendanceState({required this.attendanceData});

  factory TodayAttendanceState.initial() =>
      TodayAttendanceState(attendanceData: AttendanceData.initial());

  @override
  List<Object> get props => [attendanceData];

  @override
  bool get stringify => true;

  TodayAttendanceState copyWith({
    AttendanceData? attendanceData,
  }) {
    return TodayAttendanceState(
      attendanceData: attendanceData ?? this.attendanceData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendanceData': attendanceData.toMap(),
    };
  }

  factory TodayAttendanceState.fromMap(Map<String, dynamic> map) {
    return TodayAttendanceState(
      attendanceData:
          AttendanceData.fromMap(map['attendanceData'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodayAttendanceState.fromJson(String source) =>
      TodayAttendanceState.fromMap(json.decode(source) as Map<String, dynamic>);
}
