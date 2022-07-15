import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/widgets/transparent_text_field.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/otp_screen.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text_field_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please enter the details below to continue.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 44),
          TextFieldContainer(
            child: TransparentTextField(
              hintText: 'Employee ID',
              keyboardType: TextInputType.number,
              onChange: (value) {},
            ),
          ),
          const SizedBox(height: 20),
          Button(
              child: const Text('Login', style: TextStyle(fontSize: 18)),
              onPressed: () => Navigate.to(context, OtpScreen.id))
        ],
      ),
    );
  }
}
