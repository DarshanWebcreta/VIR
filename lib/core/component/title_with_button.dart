import 'package:flutter/material.dart';
import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class TitleWithButton extends StatelessWidget {
  final String title;
  final String btnTitle;
  final VoidCallback onPress;

  const TitleWithButton({
    super.key,
    required this.onPress,
    required this.btnTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(horiZontalPadding: 12, verticalPadding: 8, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: title,fontSize: FontSizes.small,fontWeight: FontWeights.large,),
        CustomButton(text: btnTitle,color: AppColors.darkBlue, fontWeight: FontWeights.large,fontSize: FontSizes.small,radius: 4,callback:onPress,vertiCalPadding: 6,horiZontalPadding: 8,)
      ],
    ));
  }
}