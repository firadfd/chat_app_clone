import 'package:chat_app_clone/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static Widget customImage({required String imagePath}) {
    return Image.asset(
      "assets/images/$imagePath",
      height: 350,
    );
  }

  static Widget customText(
      {required String text,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      required BuildContext context}) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize,
            color: color ??
                (Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textdarkmode
                    : AppColors.textlightmode),
            fontWeight: fontWeight),
        textAlign: TextAlign.center);
  }

  static Widget customButton(
      {required String text, required VoidCallback callback, Color? color}) {
    return SizedBox(
      height: 52,
      width: 327,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26))),
          onPressed: () {
            callback();
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }

  static customTextField(
      {required TextEditingController controller,
      required String text,
      required TextInputType textInputType,
      required BuildContext context,
      required IconData iconData}) {
    return Container(
      height: 45,
      width: 360,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.containerdarkmode
              : AppColors.containerlightmode,
          borderRadius: BorderRadius.circular(7)),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: Icon(
              iconData,
              color: AppColors.iconlight,
            ),
            hintStyle: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.hintdarkmode
                    : AppColors.hintlightmode,
                fontSize: 14),
            border: InputBorder.none),
      ),
    );
  }
}
