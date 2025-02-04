
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/text_widget.dart';

import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class StatusCard extends StatelessWidget {

final String id;
final String? sort;
final String title;
final String status;
final VoidCallback deletePress;
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
                 Expanded(
                   child: TextWidget(
                    text:id ,
                    fontSize: FontSizes.mediuam,
                    fontWeight: FontWeights.small,
                                   ),
                 ),
               if(sort!=null) Expanded(
                 child: TextWidget(
                    text:"Sort . $sort" ,
                    fontSize: FontSizes.mediuam,
                    fontWeight: FontWeights.small,
                  ),
               ),
                SizedBox(
                    child: CustomCard(child:  TextWidget(text: status,).paddingSymmetric(vertical: 2.h,horizontal: 4.w)))
              ],
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: TextWidget(
                    text: " $title",
                    fontSize: FontSizes.mediuam,
                    fontWeight: FontWeights.large,
                               ),
                 ),
                 
                 IconWidget(icon: Icons.delete,onPress: deletePress,clr: Colors.red,)
               ],
             ),

          ],
        ).paddingSymmetric(vertical: 14.h, horizontal: 10.w));
  }

StatusCard({required this.id,this.sort,required this.title,required this.status,required this.deletePress});
}