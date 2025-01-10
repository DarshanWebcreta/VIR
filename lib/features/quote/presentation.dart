import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/divider_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class Quatation extends StatefulWidget {
  const Quatation({super.key});

  @override
  State<Quatation> createState() => _QuatationState();
}

class _QuatationState extends State<Quatation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Quote",home: true,),
      body: Column(
        children: [
          CustomButton(text: "+ Add New Quote", callback: () {
            Get.toNamed(RoutesNames.addNewQuote);
          },vertiCalPadding: FixSizes.paddingVertical,color: AppColors.themeColor,radius: 6,).paddingSymmetric(vertical: 20.h),

          Expanded(
            child: ListView.builder(padding: EdgeInsets.zero,itemCount: 5,itemBuilder: (context, index) {
              return CardWidget(radius: 8,horiZontalPadding: 0,verticalPadding: 0,child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(text: '172 . GRE Renew Enertech Limited',fontSize: FontSizes.mediuam,fontWeight: FontWeights.large,),
                      const TextWidget(text: 'Security Service . 9909925737',fontSize: FontSizes.small,clr: AppColors.grey,fontWeight: FontWeights.small,).paddingOnly(top: 8.h,bottom: 4.h),
                      const TextWidget(text: 'Account@greinida.com',fontSize: FontSizes.small,clr: AppColors.grey,fontWeight: FontWeights.small,),
                    ],
                  ).paddingSymmetric(vertical:12.h,horizontal: 10.w),
                  const DividerWidget(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            TextButtonWidget(onPress: () {

                            },btnTxt: "Send Email",),
                            const VerticalDeviderWidget().paddingSymmetric(horizontal: 6.w),
                            TextButtonWidget(onPress: () {

                            },btnTxt: "Quotation PDF",),
                            const VerticalDeviderWidget().paddingSymmetric(horizontal: 6.w),

                            TextButtonWidget(onPress: () {

                            },btnTxt: "Salary PDF",),
                          ],
                        ),
                      ),
                      TextButtonWidget(onPress: () {

                      },btnTxt: "Delete",txtClr: AppColors.red,),
                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                ],
              ),).paddingOnly(bottom: 8.h);
            },),
          )
        ],
      ).paddingSymmetric(horizontal: FixSizes.paddingAllAndHorizontol),
    );
  }
}

class VerticalDeviderWidget extends StatelessWidget {
  const VerticalDeviderWidget({
    super.key,
    this.width = 1,
    this.height = 12,
  });
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(width: width.w,height: height.h,color: AppColors.black,);
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
   required this.onPress,
    required this.btnTxt,
     this.txtClr = AppColors.themeColor,
  });
  final VoidCallback onPress;
  final String btnTxt;
  final Color  txtClr;
  @override
  Widget build(BuildContext context) {
    return TextButton(style: TextButton.styleFrom(padding: EdgeInsets.all(1.w)),onPressed:onPress, child:
    TextWidget(text:btnTxt,fontSize: FontSizes.small,clr: txtClr, ));
  }
}
