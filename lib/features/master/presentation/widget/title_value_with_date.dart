
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';

class TitleValueWithDate extends StatelessWidget {
  final  String id ;
  final  String date ;
  final  String value ;
  const TitleValueWithDate({
    super.key,
    required this.id,
    required this.date,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        spreadRadius: 0,
        blurRadius: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children:  [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: id,
                  fontSize: FontSizes.mediuam,
                  fontWeight: FontWeights.small,
                ),
                TextWidget(
                  text: Operation.dateFormateForUi(date),
                  fontSize: FontSizes.mediuam,
                  fontWeight: FontWeights.small,
                ),
              ],
            ),
            TextWidget(
              text: value,
              fontSize: FontSizes.mediuam,
              fontWeight: FontWeights.large,
            ),

          ],
        ).paddingSymmetric(vertical: 14.h, horizontal: 10.w)).paddingOnly(bottom: 6.h);
  }
}