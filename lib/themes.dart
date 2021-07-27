import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

class TwitterTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: blueTColor)),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black87,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black87,
            iconTheme: IconThemeData(color: blueTColor)),
      );

  static Color blueTColor = HexColor("#1DA1F2");
  static Color blackTColor = HexColor("#14171A");
  static Color darkTgrey = HexColor("#657786");
  static Color lightTgrey = HexColor("#AAB8C2");
  static Color extraLightTgrey = HexColor("#E1E8ED");
  static Color extraextraLightTgrey = HexColor("#F5F8FA");
}
