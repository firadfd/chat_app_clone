import 'package:chat_app_clone/utils/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';
import 'otp_screen.dart';

class LogInScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: UiHelper.customButton(
            text: "Continue",
            callback: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OtpScreen(number: phoneController.text)));
            }),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(
                  text: "Enter Your Phone Number",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  context: context),
              SizedBox(height: 10),
              UiHelper.customText(
                  text:
                      "Please confirm your country code and enter \nyour phone number",
                  fontSize: 14,
                  context: context),
              SizedBox(height: 30),
              UiHelper.customTextField(
                  controller: phoneController,
                  text: "Phone Number",
                  textInputType: TextInputType.number,
                  context: context,
                  iconData: Icons.phone),
              SizedBox(height: 30),

            ],
          ),
        ));
  }
}
