import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Home/home_screen.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/widgets/text_field_box.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final digit1Controller = TextEditingController();
  final digit2Controller = TextEditingController();
  final digit3Controller = TextEditingController();
  final digit4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String mobile = '03161604575';

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
                  MyText.body('Code is sent to $mobile'),
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
                            // onSubmit(onSuccess);
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
                      // onPressed: () => onSubmit(onSuccess),
                      onPressed: () => Navigate.to(context, HomeScreen.id),
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
