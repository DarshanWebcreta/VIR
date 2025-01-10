

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  final String path;
  final double height;
  final double width;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  const SvgWidget({
    super.key,
    required this.width,
    required this.height,
    this.colorFilter ,
    required this.path,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(height: height.h,width: width.w,path,colorFilter: colorFilter,);
  }
}