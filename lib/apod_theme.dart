import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApodTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    subtitle1: GoogleFonts.openSans(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    subtitle2: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    subtitle1: GoogleFonts.openSans(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    subtitle2: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  // 3
  static light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.purple,
        secondary: Colors.purpleAccent,
        brightness: Brightness.light,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.purple[300],
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.purple,
        secondary: Colors.purpleAccent,
        brightness: Brightness.dark,
      ),
      textTheme: darkTextTheme,
    );
  }
}
