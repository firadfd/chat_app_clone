import 'package:chat_app_clone/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/constants/theme_cubits/theme_cubit.dart';
import '../utils/constants/theme_cubits/theme_state.dart';
import '../utils/custom_widgets/ui_helper.dart';
import 'log_in_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.scaffolddark
              : AppColors.scaffoldlight,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).toggleTheme();
              },
              icon: Icon(
                context.watch<ThemeCubit>().state is DarkThemeStates
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: context.watch<ThemeCubit>().state is DarkThemeStates
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
        floatingActionButton: UiHelper.customButton(
            text: "Start Messaging",
            color: Color(0xff002DE3),
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                UiHelper.customImage(imagePath: "onboarding.png"),
                SizedBox(height: 20),
                UiHelper.customText(
                    text:
                        "Connect easily with \nyour family and friends \nover countries",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    context: context),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
