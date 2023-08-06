import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xff9c201a);
  static const Color whiteColor = Color(0xffffffff);
  static const Color secondaryColor = Color.fromRGBO(178, 183, 198, 1);
  static const Color yellowColor = Color(0xfffaaf39);
  static const Color brownColor = Color(0xff452423);
  static const Color titleBlackColor = Color(0xff1a201d);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color greyTxtColor = Color(0xff8c8c8c);
  static const Color greyRegularColor = Color(0xffabadac);
  static const Color lightGreyColor = Color(0xffd6d6d6);
  static const Color errorColor = Color(0xffB3171C);
  static const Color dividerColor = Color(0xffE3E3E3);
  static const Color blackColor = Colors.black;
  static const Color _iconsColor = Colors.white;

  static final themeData = ThemeData(
      primaryColor: primaryColor,
      focusColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: "tw",

      progressIndicatorTheme: const ProgressIndicatorThemeData(color: primaryColor),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: _iconsColor),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      iconTheme: const IconThemeData(color: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              } else if (states.contains(MaterialState.pressed)) {
                return secondaryColor;
              } else {
                return primaryColor;
              }
            },
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
      ),
      dividerColor:dividerColor ,
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.secondaryColor)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primaryColor)),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.secondaryColor)),
        border: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.secondaryColor)),
        filled: true,
        fillColor: Color(0xffF6F6F6),
        focusColor: Color(0xffF6F6F6),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor));
}
