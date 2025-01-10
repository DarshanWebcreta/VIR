
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vir/core/component/icon_widget.dart';

import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class DotWithValues extends StatelessWidget {
  final String leftValue;
  final String rightValue;
  final Color rightValueClr;
  final Color leftValueClr;
  final FontWeight rightValueFontWeight;
  final FontWeight leftValueFontWeight;

  final double rightFontSize;
  final double leftFontSize;
  const DotWithValues({
    super.key,
    required this.leftValue,
    required this.rightValue,
     this.rightFontSize =FontSizes.small ,
     this.leftFontSize =FontSizes.small ,
     this.rightValueFontWeight =FontWeights.large ,
     this.leftValueFontWeight =FontWeights.large,
     this.leftValueClr = AppColors.black,
    this.rightValueClr = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(text: leftValue,fontWeight:leftValueFontWeight,fontSize: leftFontSize,clr: leftValueClr,),
      if(rightValue.isNotEmpty)  IconWidget(icon: Icons.circle,size: 5,clr: AppColors.grey,).paddingSymmetric(horizontal: 6.w),
        Expanded(child: TextWidget(text: rightValue,clr: rightValueClr,fontWeight: FontWeights.large,fontSize: rightFontSize,)),
      ],
    );
  }
}