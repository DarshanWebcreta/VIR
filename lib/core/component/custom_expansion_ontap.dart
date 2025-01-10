

import 'package:flutter/material.dart';

import 'package:vir/core/component/card_widget.dart';

import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';

class CustomExpantionTileWithOnTap extends StatelessWidget {
  const CustomExpantionTileWithOnTap({
    super.key,
    required this.title,
    required this.onPress,
     this.bgClr= AppColors.bgColor,
  });
  final VoidCallback onPress;
  final String title;
  final Color bgClr ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CardWidget(bgClr: bgClr, horiZontalPadding: 12, verticalPadding: 14, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: title,fontWeight: FontWeights.large,fontSize: FontSizes.mediuam,),
          FunctionalWidget.customCircleAvtar(bgClr: AppColors.white)
        ],
      )),
    );
  }
}