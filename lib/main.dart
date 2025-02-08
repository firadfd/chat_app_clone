import 'package:chat_app_clone/screens/on_boarding.dart';
import 'package:chat_app_clone/utils/constants/app_themes.dart';
import 'package:chat_app_clone/utils/constants/theme_cubits/theme_cubit.dart';
import 'package:chat_app_clone/utils/constants/theme_cubits/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeCubit(prefs: prefs),
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state is LightThemeStates
                ? AppThemes.lightTheme
                : AppThemes.darkTheme,
            home: OnBoarding(),
          );
        }));
  }
}
