// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'package:vir/core/component/text_widget.dart';
// import 'package:vir/core/theme/app_colors.dart';
// import 'package:vir/core/utils/font_size.dart';
// import 'package:vir/core/utils/font_weight.dart';
// class IconWithText extends StatelessWidget {
//   final double height;
//   final double width;
//   final String iconSvg;
//   final String title;
//   final Color clr;
//   final VoidCallback onPress;
//
//   const IconWithText({super.key, required this.onPress,required this.title,this.height = 18, this.width= 18,required this.iconSvg, this.clr = AppColors.darkBlue});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:onPress,
//       child: Row(
//         children: [
//           SvgWidget(width: 18, height: 18, path: iconSvg,colorFilter: ColorFilter.mode(clr,BlendMode.srcIn),).paddingOnly(right: 8.w),
//           TextWidget(text: title,fontSize: FontSizes.mediuam,clr: clr,fontWeight: FontWeights.large,)
//         ],
//       ),
//     );
//   }
// }