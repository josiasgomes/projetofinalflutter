import 'package:flutter/material.dart';
import 'package:myapp/src/core/theme/app_colors.dart';

class AppButtonstyle {
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
                    border: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: buttonBorderRadiusStandart,
                      borderSide: BorderSide.none,
                      ),
                    );
                  

  static ButtonStyle elevattedButtonStandart = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: buttonBorderRadiusStandart),
    padding: buttonPaddingStandart,
  );
}
