import 'package:flutter/material.dart';
import 'package:myapp/src/core/theme/app_colors.dart';
import 'package:myapp/src/core/theme/app_textStyle.dart';

class AppButtonStyle {
  //Sizes
  static final BorderRadius buttonBorderRadiusStandart = BorderRadius.circular(
    30.0,
  );
  static final EdgeInsets buttonPaddingStandart = EdgeInsets.symmetric(
    vertical: 16.0,
  );

  //Buttons
  static InputDecoration passwordTextField = InputDecoration(
                    hintText: 'Senha',
                    hintStyle: AppTextstyle.textLarge1,
                    border: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                      borderSide: BorderSide.none,
                      ),
                    fillColor: AppColors.buttonBg,
                    filled: true,
                    );

  static InputDecoration emailTextField = InputDecoration(
                    hintText: 'Email',
                    hintStyle: AppTextstyle.textLarge1,
                    border: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                      borderSide: BorderSide.none,
                      ),
                    fillColor: AppColors.buttonBg,
                    filled: true,
                    );          

  static ButtonStyle elevattedButtonStandart = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: buttonBorderRadiusStandart),
    padding: buttonPaddingStandart,
  );
}
