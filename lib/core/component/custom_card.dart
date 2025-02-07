
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vir/core/theme/app_colors.dart';

class CustomCard extends StatelessWidget {

  final double radius;
  final Widget child;
  final Color color;
  final double blurRadius;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius.r),
      color: color,
      boxShadow:  [
        BoxShadow(color: AppColors.grey.withValues(alpha: 0.1),blurRadius: blurRadius,spreadRadius:spreadRadius,)
      ]
    ),
      child: child,
    );
        //Card(elevation :4,shadowColor: AppColors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
    //       color:color,margin: EdgeInsets.zero,child: child,);
  }

  const CustomCard({super.key, this.spreadRadius= 2,this.blurRadius = 2,this.radius = 12, required this.child, this.color= AppColors.white });
}