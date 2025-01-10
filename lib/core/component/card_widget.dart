import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/theme/app_colors.dart';

class CardWidget extends StatelessWidget {
  final double verticalPadding;
  final double horiZontalPadding;
  final double radius;
  final Color bgClr;
  final Color borderClr;
  final Widget child;
  const CardWidget({
    super.key,
    this.radius = 8,
    required this.child ,
     this.bgClr =  AppColors.white,
     this.borderClr =  AppColors.transparent,
    required this.horiZontalPadding ,
    required this.verticalPadding
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgClr,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r),side: BorderSide(color: borderClr,width: 1)) ,
      margin: EdgeInsets.zero,
      child:child.paddingSymmetric(horizontal: horiZontalPadding,vertical: verticalPadding),
    );
  }
}