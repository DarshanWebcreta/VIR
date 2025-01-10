import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vir/core/theme/app_colors.dart';

class IconWidget extends StatelessWidget {
  final double size;
  final Color clr;
  final VoidCallback? onPress;
  final IconData icon;

  const IconWidget({
    super.key,
    required this.icon,
     this.onPress,
    this.size=20,
    this.clr = AppColors.grey
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Icon(icon,size: size.w,color: clr,));
  }
}
