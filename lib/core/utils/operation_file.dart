
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vir/core/theme/app_colors.dart';

class Operation{
  Operation._();
  static String generateNickname(String fullName) {

    List<String> parts = fullName.split(' ');


    String nickname = '';


    for (String part in parts) {

      if (part.isNotEmpty) {
        nickname += part[0].toUpperCase();
      }
    }

    return nickname;
  }
  static void redirectToBrowser(String url) async {
    final Uri uri = Uri.parse(url); // Use Uri.parse to handle full URLs

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
  static String dateFormateForUi(String inputDate) {
    // Parse the input date string
    DateTime parsedDate = DateTime.parse(inputDate);

    // Format the parsed date to the desired format
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

    return formattedDate;
  }
  static Future<DateTime?> getDate(
      { String startDate = '',}) {
    return showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                  AppColors.themeColor, // button text color
                ),
              ),
              colorScheme: const ColorScheme.light(
                primary:
                AppColors.themeColor, // header background color
                onPrimary: AppColors.white, // header text color
                onSurface: AppColors.grey, // body text color
              ).copyWith(
                  surface: AppColors.themeColor,
                  onPrimary: Colors.white,
                  primary: AppColors.themeColor),
            ),
            child: child!,
          );
        },
        context: Get.context!, //context of current state
        initialDate: startDate.isEmpty? null : DateFormat('yyyy-MM-dd').parse(startDate),
        firstDate:
        startDate.isEmpty?  DateTime(2000)
            : DateFormat('yyyy-MM-dd').parse(startDate),
        lastDate: DateTime.now());
  }
}