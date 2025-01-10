// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



TextStyle googleDMSansSmall({double size = 12,Color clr = Colors.white,FontWeight weight= FontWeight.w400,TextDecoration decor= TextDecoration.none}) {
  return GoogleFonts.poppins(
    color: clr,
    fontSize: size.sp,
    decoration: decor,
    fontWeight: weight,
  );
}