import 'package:flutter/material.dart';
import 'package:myapp/src/core/theme/app_colors.dart';

class AppTextstyle {
  //heading and subtitles
  static TextStyle heading1 = TextStyle(
    fontSize: 30,
    fontFamily: "Otomanopee One",
    color: AppColors.secundary,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 25,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
    color: AppColors.secundary,
  );

  static TextStyle subTitle1 = TextStyle(
    fontSize: 20,
    fontFamily: "Montserrat",
    color: AppColors.primary,
  );

  //texts sizes
  static TextStyle textSmall1 = TextStyle(
    fontSize: 12,
    fontFamily: "Montserrat",
    color: AppColors.text,
  );

  static TextStyle textSmall2 = TextStyle(
    fontSize: 12,
    fontFamily: "Roboto",
    color: AppColors.text,
  );

  static TextStyle textLarge1 = TextStyle(
    fontSize: 20,
    fontFamily: "Montserrat",
    color: AppColors.text,
  );

  static TextStyle textLarge2 = TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
    color: AppColors.text,
  );

  static TextStyle clickableButton = TextStyle(
    fontSize: 25,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
