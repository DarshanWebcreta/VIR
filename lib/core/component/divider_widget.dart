import 'package:flutter/material.dart';
import 'package:vir/core/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  final Color clr;
  final double height;
  const DividerWidget({
    super.key,
    this.height = 1,
    this.clr =AppColors.grey ,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: height,color:clr.withValues(alpha: 0.2) ,);
  }
}