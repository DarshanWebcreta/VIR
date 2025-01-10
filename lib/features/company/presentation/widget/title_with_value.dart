import 'package:flutter/material.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class TitleWithValue extends StatelessWidget {
  const TitleWithValue({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: "$title : ",
          clr: AppColors.grey,
          fontSize: FontSizes.small,
          fontWeight: FontWeights.large,
        ),
        TextWidget(
          text: value,
          clr: AppColors.grey,
          fontSize: FontSizes.small,
          fontWeight: FontWeights.medium,
        ),
      ],
    );
  }
}