

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color bgColor = Color(0xFFF6F6F6);
  static const Color themeColor = Color(0xFFD08D3C);
  static const Color lightThemeClr =  Color(0xFFFFF8F0);
  static const Color darkBlue = Color(0xFF659FFF);
  static const Color black = Color(0xFF1E1E1E);
  static const Color grey = Color(0xFF797979);
  static const Color borderGrey = Color(0xFFdbe0de);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color lightBlue = Color(0xFFD3EAFD);

  static const Color brinjalClr = Color(0xFF6C6FFF);
  static const Color inactiveClr = Color(0xFFa7b3bd);
  static const Color white = Colors.white;
  static  Color shimmerClr = Colors.grey[300]!;

  static const Color red = Colors.red;
  static const Color transparent = Colors.transparent;
  static  LinearGradient gradiant() {
    return LinearGradient(

      colors: [
        Color(0xFFD08D3C), // upper color
        Color(0xFF93642B), // upper color

      ],
      begin: Alignment.topCenter,

      end: Alignment.bottomCenter,
    );
  }
}
