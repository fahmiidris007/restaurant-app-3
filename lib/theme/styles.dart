import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF37966F);
const Color onPrimaryColor = Colors.black;
const Color darkPrimaryColor = Color(0xFF121212);
const Color darkSecondaryColor = Color(0xFF37966F);
const Color onDarkPrimaryColor = Colors.white;

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        secondary: secondaryColor,
      ),
  textTheme: myTextTheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: primaryColor,
      textStyle: myTextTheme.bodyLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: onPrimaryColor,
        secondary: darkSecondaryColor,
      ),
  textTheme: myTextTheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: darkSecondaryColor,
      onPrimary: darkPrimaryColor,
      textStyle: myTextTheme.bodyLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.eczar(
      fontSize: 109, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.eczar(
      fontSize: 68, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.eczar(fontSize: 55, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.eczar(
      fontSize: 39, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.eczar(fontSize: 27, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.eczar(
      fontSize: 23, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.eczar(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.eczar(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.robotoCondensed(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.robotoCondensed(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.robotoCondensed(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.robotoCondensed(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.robotoCondensed(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
