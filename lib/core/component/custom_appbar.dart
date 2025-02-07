
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/circle_button.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/key/image_keys.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool home;
  final bool scanner;
  final bool backBtn;

  final VoidCallback? callback;
  const CustomAppBar({
    super.key,
    required this.title,
     this.callback,
    this.home = true,
    this.scanner = false,
    this.backBtn = false,
  });

  @override
  Widget build(BuildContext context,) {


    return AppBar(
      leadingWidth: !backBtn?0:40.w,
      leading:backBtn? CircleIconButton(icon: Icons.arrow_back_ios_rounded,backgroundColor: AppColors.transparent,iconColor: AppColors.white, onPressed: () {
        Get.back();
      },).paddingOnly(left: 8.w):null,
      backgroundColor: AppColors.themeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r),bottomRight: Radius.circular(12.r))),

      title:  TextWidget(text:title ,fontWeight: FontWeights.large,fontSize: FontSizes.large,clr: AppColors.white,),
      automaticallyImplyLeading: false,);
  }

  @override
  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // or any height you prefer
}