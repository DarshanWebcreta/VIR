
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class TitleValueWithDate extends StatelessWidget {
  const TitleValueWithDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        spreadRadius: 0,
        blurRadius: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: const [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "172",
                  fontSize: FontSizes.mediuam,
                  fontWeight: FontWeights.small,
                ),
                TextWidget(
                  text: "12/10/2024",
                  fontSize: FontSizes.mediuam,
                  fontWeight: FontWeights.small,
                ),
              ],
            ),
            TextWidget(
              text: "987979797",
              fontSize: FontSizes.mediuam,
              fontWeight: FontWeights.large,
            ),

          ],
        ).paddingSymmetric(vertical: 14.h, horizontal: 10.w)).paddingOnly(bottom: 6.h);
  }
}