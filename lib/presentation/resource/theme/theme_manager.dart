import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/fonts/font_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/style_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/values_manger.dart';

class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      // Main Color
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacity70,
      colorScheme: ColorScheme.light(
        secondary: ColorManager.grey,
      ),

      // Card View
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      // App bar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getTextStyle(
          color: ColorManager.white,
          fontSize: FontManager.s16,
        ),
      ),
      //Button
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getTextStyle(color: ColorManager.white),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),
      // Text
      textTheme: TextTheme(
        headline1: getTextStyle(color: ColorManager.darkGray, fontSize: FontManager.s16, fontWeight: FontManager.semiBold),
        subtitle1: getTextStyle(color: ColorManager.lightGrey, fontSize: FontManager.s14, fontWeight: FontManager.medium),
        subtitle2: getTextStyle(color: ColorManager.primary, fontSize: FontManager.s14, fontWeight: FontManager.medium),
        caption: getTextStyle(color: ColorManager.grey1),
        bodyText1: getTextStyle(color: ColorManager.grey),
      ),
      // input decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getTextStyle(color: ColorManager.grey1),
        labelStyle: getTextStyle(color: ColorManager.darkGray, fontWeight: FontManager.medium),
        errorStyle: getTextStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    );
  }
}
