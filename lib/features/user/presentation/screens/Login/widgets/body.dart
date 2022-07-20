import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Login/widgets/transparent_text_field.dart';
import 'package:orio_attendance_app_flutter/features/user/presentation/screens/Otp/otp_screen.dart';
import 'package:orio_attendance_app_flutter/shared/routes/navigate.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/alert.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/button.dart';
import 'package:orio_attendance_app_flutter/shared/widgets/text_field_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final idController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() => Navigate.to(context, OtpScreen.id);

  void onSubmit(VoidCallback onSuccess) async {
    final form = formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (idController.text != '') {
        await context.read<UserCubit>().login(idController.text);
        if (context.read<UserCubit>().state.status == UserStatus.error) {
          idController.clear();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Login Failed!',
                body: 'Employee ID is incorrect',
              );
            },
          );
        } else {
          onSuccess.call();
        }
        form.save();
      }
    } else {}
  }

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
      child: Form(
        key: formKey,
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
                controller: idController,
                hintText: 'Employee ID',
                keyboardType: TextInputType.number,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            Button(
              child:
                  context.watch<UserCubit>().state.status == UserStatus.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Login', style: TextStyle(fontSize: 18)),
              onPressed: () => onSubmit(onSuccess),
            ),
          ],
        ),
      ),
    );
  }
}
