import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/shimmer_effect.dart';
import 'package:vir/core/component/sizebox_widget.dart';

class ListShimmerEffect extends StatelessWidget {
  const ListShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: 10,itemBuilder: (context, index) {
      return CustomSizeBox(height: 102.h, width: 0,child: const ShimmerCard(radius: 8,),).paddingOnly(top: 6.h);
    },);
  }
}