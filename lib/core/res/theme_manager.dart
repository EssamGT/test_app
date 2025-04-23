
import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/style_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
    backgroundColor: ColorManager.white,
      foregroundColor: ColorManager.black,
      centerTitle: true,
      elevation: 0,   
        
    ),
    textTheme:  TextTheme(
     headlineMedium: getSemiBoldStyle(color: ColorManager.burble,fontSize: FontSize.s16),
     labelSmall: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s12),
      titleSmall: getLightStyle(color: ColorManager.black,
      fontSize: FontSize.s16
      )
  ),
  
  );
}
