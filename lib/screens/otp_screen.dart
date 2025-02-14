import 'package:chat_app_clone/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/constants/app_colors.dart';
import '../utils/custom_widgets/ui_helper.dart';

class OtpScreen extends StatelessWidget {
  final String number;

  OtpScreen({super.key, required this.number});

  TextEditingController otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customText(
                text: "Enter Code",
                fontWeight: FontWeight.bold,
                fontSize: 24,
                context: context),
            SizedBox(height: 10),
            UiHelper.customText(
                text: "We have sent you an SMS with the code to \n+88$number",
                fontSize: 14,
                context: context),
            SizedBox(height: 30),
            Pinput(
              controller: otpController,
              onCompleted: (value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              defaultPinTheme: defaultPinTheme,
              submittedPinTheme: submittedPinTheme,
              focusedPinTheme: focusedPinTheme,
            ),
            SizedBox(height: 30),
            UiHelper.customButton(
                text: "Resend Code",
                callback: () {})
          ],
        ),
      ),
    );
  }
}
