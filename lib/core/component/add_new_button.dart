import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
class AddNewButton extends StatelessWidget {
  const AddNewButton({
    super.key,
    required this.onPress
  });
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      fontWeight: FontWeights.large,
      fontSize: FontSizes.mediuam,
      fontClr: AppColors.themeColor,
      vertiCalPadding: 18.h,
      radius: 6,
      color: AppColors.lightThemeClr,
      text: "+ Add New ",
      callback: onPress,
    );
  }
}