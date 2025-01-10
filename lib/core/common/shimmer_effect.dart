import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double radius;
  const ShimmerCard({
    super.key,this.radius = 12
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:AppColors.white ,

      highlightColor:AppColors.shimmerClr ,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(radius.r)
        ),
      ),
    );
  }
}