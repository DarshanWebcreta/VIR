
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: ListView(
        children: [
          cardWidget(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text: "Profile Details",fontSize: FontSizes.large,fontWeight: FontWeights.large,).paddingOnly(bottom: 16.h),
              const TextFieldWidget(labelTxt: "User name*",hintTxt: "Enter user name",).paddingOnly(bottom: 6.h),
              const TextFieldWidget(labelTxt: "Email*",hintTxt: "Enter email ",),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 6.w,
                children: [
                  CustomButton(borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,text: "Discard", callback: () {

                  },horiZontalPadding: 15,vertiCalPadding: 6,),
                  CustomButton(text: "Save", callback: () {

                  },horiZontalPadding: 15,vertiCalPadding: 6,),

                ],
              ).paddingOnly(top: 18.h),

            ],
          ))
          .paddingOnly(top: 24.h,bottom: 12.h),

          cardWidget(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text: "Update Password",fontSize: FontSizes.large,fontWeight: FontWeights.large,).paddingOnly(bottom: 16.h),
              const TextFieldWidget(labelTxt: "Current Password*",hintTxt: "Enter password",).paddingOnly(bottom: 10.h),
              const TextFieldWidget(labelTxt: "Old Password*",hintTxt: "Enter password ",).paddingOnly(bottom: 10.h),
              const TextFieldWidget(labelTxt: "New Password*",hintTxt: "Enter password ",),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 6.w,
                children: [
                  CustomButton(borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,text: "Discard", callback: () {

                  },horiZontalPadding: 15,vertiCalPadding: 6,),
                  CustomButton(text: "Save", callback: () {

                  },horiZontalPadding: 15,vertiCalPadding: 6,),

                ],
              ).paddingOnly(top: 18.h),

            ],
          )),



        ],
      ),
    );
  }

  CardWidget cardWidget({required Widget child}) {
    return CardWidget(horiZontalPadding: FixSizes.paddingAllAndHorizontol, verticalPadding: 12.h, child: child);
  }
}
