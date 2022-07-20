import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/text_field_box.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/alert.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class Body extends HookWidget {
  Body({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final digit1Controller = TextEditingController();
  final digit2Controller = TextEditingController();
  final digit3Controller = TextEditingController();
  final digit4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String phone = context.read<UserCubit>().state.user.phone;

    void fetchStations() async {
      String token = context.read<UserCubit>().state.user.token;
      await context.read<StationCubit>().get(token);
    }

    useEffect(() {
      fetchStations();
      return null;
    }, []);

    void onSuccess() => Navigate.next(context, HomeScreen.id);

    void onSubmit(VoidCallback onSuccess) async {
      final form = formKey.currentState;
      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (digit1Controller.text != '' ||
            digit2Controller.text != '' ||
            digit3Controller.text != '' ||
            digit4Controller.text != '') {
          String otp =
              '${digit1Controller.text}${digit2Controller.text}${digit3Controller.text}${digit4Controller.text}';
          if (otp == BlocProvider.of<UserCubit>(context).state.user.otp) {
            context.read<UserCubit>().verifyOtp();
            onSuccess.call();
          } else {
            digit1Controller.clear();
            digit2Controller.clear();
            digit3Controller.clear();
            digit4Controller.clear();

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  heading: 'Error!',
                  body: 'OTP is incorrect',
                );
              },
            );
          }
          form.save();
        }
      } else {}
    }

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            height: size.height * 0.8,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/otp.svg'),
                  const SizedBox(height: 25),
                  MyText.body('Code is sent to $phone'),
                  const SizedBox(height: 44),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldBox(
                        controller: digit1Controller,
                        autofocus: true,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: digit2Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: digit3Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: digit4Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            onSubmit(onSuccess);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: Button(
                      child: const Text('Verify'),
                      onPressed: () => onSubmit(onSuccess),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
