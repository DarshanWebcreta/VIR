import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';


class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.value,
     this.label = '',
    this.size = 16,
    this.fontSize = FontSizes.mediuam,

    required this.callback,
     this.fontWeight = FontWeights.small,

  });

  final bool value;
final double fontSize;
  final String label;
  final double size;
  final FontWeight fontWeight;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: size.w,height: size.w,
            decoration:  BoxDecoration(color: value?AppColors.darkBlue:AppColors.white,border: Border.all(color:value?AppColors.white: AppColors.grey)),child: const Center(child: TextWidget(text: "✓",fontSize: 10,clr: AppColors.white,fontWeight: FontWeight.w500,)),),
         if(label.isNotEmpty) TextWidget(text:label,fontSize:fontSize ,fontWeight: fontWeight,).paddingOnly(left: 8.w),

        ],
      ),
    );
  }
}