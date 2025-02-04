import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/custom_button.dart';

import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';

import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/storage/app_storage.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';

import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/operation_file.dart';

import 'dart:async';

class FunctionalWidget {
  FunctionalWidget._();
  static void loaderHideShow({required bool loaderShow}) {
    loaderShow
        ? Get.context!.loaderOverlay.show()
        : Get.context!.loaderOverlay.hide();
  }

  static String convertToTitleCase(String text) {
    return text
        .split('_') // Split the text by underscores
        .map((word) =>
            word[0].toUpperCase() + word.substring(1)) // Capitalize each word
        .join(' '); // Combine them back with spaces
  }

  static Widget customCircleAvtar(
      {double radius = 15,
      Color bgClr = AppColors.bgColor,
      double iconSize = 20,
      Color iconClr = AppColors.grey}) {
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: bgClr,
      child: IconWidget(
        icon: Icons.keyboard_arrow_down,
        size: iconSize,
        clr: iconClr,
      ),
    );
  }

  static void unfocusKeyboard() =>
      FocusManager.instance.primaryFocus?.unfocus();
  static void logout() {
    StorageManager.deleteAllData();
    Get.offAllNamed(RoutesNames.login);
    FunctionalWidget.showSnackBar(title: 'Logout SuccessFully', success: false);
  }

  static Widget labelWithTextField(
      {required String labelTxt, Function(String)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: labelTxt,
          fontWeight: FontWeights.small,
          fontSize: FontSizes.small,
          clr: AppColors.grey,
        ).paddingOnly(bottom: 4.h),
        TextFieldWidget(
          filled: true,
          onChanged: onChanged,
          hintTxt: "**********",
        ).paddingOnly(bottom: 10.h)
      ],
    );
  }
  static Future<dynamic> askUserDialog(
      {required VoidCallback cancel,
        required VoidCallback yes,
        required String title,
        bool subDec = false,
        required String des,
        String sDec = ''}) {
    return showDialog(

      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor:AppColors.bgColor,
          // insetPadding: EdgeInsets.all(16.w),
          // contentPadding: EdgeInsets.all(16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.question_mark,
                  size: 60.w,
                  color: AppColors.themeColor,
                  weight: 5,
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextWidget(text: title,fontSize: FontSizes.mediuam,fontWeight: FontWeights.medium,maxLine: 4,textAlign: TextAlign.center,),
                TextWidget(text: des,fontSize: FontSizes.small,fontWeight: FontWeights.small,maxLine: 4,textAlign: TextAlign.center,clr: AppColors.grey,).paddingOnly(bottom: 38.h,top: 8.h, right: 10.w, left: 10.w),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 38.h,
                      width: 114.w,
                      child:CustomButton(text: "Cancel", callback: cancel,color: AppColors.bgColor,fontClr: AppColors.themeColor,borderClr: AppColors.themeColor,),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      height: 38.h,
                      width: 114.w,
                      child:CustomButton(text: "Yes", callback: yes,color: AppColors.themeColor,fontClr: AppColors.white,),
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );

  }
  static void showSnackBar({required String title, required bool success}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: success ? AppColors.green : AppColors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Widget dropDownButton(
      {required String label,
      bool displayAddBtn = false,
      Color color = AppColors.lightGrey,
      required String title,
      required VoidCallback onTap,
      VoidCallback? addTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: label,
          fontSize: FontSizes.small,
          fontWeight: FontWeights.large,
        ).paddingOnly(bottom: 6.h),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: CardWidget(
                    bgClr: color,
                    horiZontalPadding: 10.w,
                    verticalPadding: FixSizes.paddingVertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: title,
                          fontSize: FontSizes.small,
                          fontWeight: FontWeights.small,
                          clr: AppColors.grey,
                        ),
                        const IconWidget(
                            icon: Icons.keyboard_arrow_down_rounded),
                      ],
                    )),
              ),
            ),
            if (displayAddBtn)
              CustomButton(
                text: "+Add",
                callback: addTap!,
                vertiCalPadding: 12.h,
                horiZontalPadding: 14.w,
              ).paddingOnly(left: 8.w)
          ],
        ),
      ],
    );
  }

  static Future<dynamic> bottomSheet(
      {required double height,
      required Widget child,
      Color? barrierClr,
      bool isDismissible = true,
      bool canPop = true,
      required String title,
      String descriptrion = ''}) {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      isDismissible: isDismissible,
      enableDrag: canPop,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      barrierColor: barrierClr,
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => PopScope(
        canPop: canPop,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: height.h,
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: title,
                      fontSize: FontSizes.large,
                      fontWeight: FontWeights.large,
                    ),
                    if (canPop)
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const IconWidget(
                          icon: Icons.close,
                          size: 25,
                          clr: AppColors.black,
                        ),
                      )
                  ],
                ),
                if (descriptrion.isNotEmpty)
                  TextWidget(
                    text: descriptrion,
                    fontSize: FontSizes.small,
                    fontWeight: FontWeights.small,
                    clr: AppColors.grey,
                  ).paddingOnly(
                    top: 8.h,
                  ),
                Expanded(child: child.paddingOnly(top: 20.h))
              ],
            ).paddingOnly(
                top: 18.h,
                left: FixSizes.paddingAllAndHorizontol,
                right: FixSizes.paddingAllAndHorizontol,
                bottom: FixSizes.paddingVertical),
          ),
        ),
      ),
    );
  }

  static Widget textButton(
      {required VoidCallback onpress,
      required String txt,
      double fontSize = FontSizes.small,
      double fontWeight = FontSizes.large,
      Color clr = AppColors.darkBlue}) {
    return InkWell(
        onTap: onpress,
        child: const TextWidget(
          text: "Link Location",
          clr: AppColors.darkBlue,
          fontWeight: FontWeights.large,
          fontSize: FontSizes.small,
        ));
  }

  static Widget nickName(
      {required String name, required double size, required double font}) {
    return CircleAvatar(
      radius: size.w,
      backgroundColor: AppColors.themeColor,
      child: TextWidget(
        text: Operation.generateNickname(name).capitalize ?? '',
        fontWeight: FontWeights.large,
        fontSize: font,
        clr: AppColors.white,
      ),
    );
  }

  static Widget customDivider(
          {required double height,
          required double width,
          required Color clr}) =>
      Container(
        height: height.h,
        width: width.w,
        color: clr,
      );
}
