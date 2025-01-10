import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/image_widget.dart';

import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/key/image_keys.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';




class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key,this.callbackAction,required this.title, this.description,this.error = false });
  final String title;
  final String ?description;

  final bool error;
  final VoidCallback ? callbackAction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
         // const ImageWidget( path:ImageStrings.emptyObject,),
          Center(child: TextWidget(text:"No $title found!",fontSize: FontSizes.mediuam,clr: AppColors.black,fontWeight: FontWeights.medium, ).paddingOnly(bottom: 8.h)),
          Center(child: TextWidget(text:error?description??"Something went wrong":'No $title available at the moment , Please try after sometime.',fontSize: FontSizes.small,clr: AppColors.black,fontWeight: FontWeights.small,textAlign: TextAlign.center,maxLine: 15, )),

          if(error) GestureDetector(
            onTap: callbackAction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh,color:AppColors.themeColor,size: 26.w ,),
                const TextWidget(text: " Retry",fontSize: FontSizes.mediuam,clr: AppColors.themeColor,fontWeight: FontWeights.medium,)
              ],
            ).paddingOnly(top: 14.h),
          )
        ],
      ).paddingSymmetric(horizontal: 16.w),
    ).paddingOnly(bottom: 100.h);
  }
}
