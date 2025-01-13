import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Masters"),
      body: Column(

       spacing: 6.h,
        children: [
           const CustomSizeBox(height: 24, width: 0),
           MasterCard(label: 'Company Details',onPress: () {
             Get.toNamed(RoutesNames.companyList);
           },),
           MasterCard(label: 'Category',onPress: () {
             Get.toNamed(RoutesNames.categoryList);

           },),
           MasterCard(label: 'Subject',onPress: () {
             Get.toNamed(RoutesNames.subjectList);

           },),
           MasterCard(label: 'Terms & Conditions',onPress: () {
             Get.toNamed(RoutesNames.tcList);

           },),
           MasterCard(label: 'Provident Fund',onPress: () {
             Get.toNamed(RoutesNames.providentfundList);

           },), MasterCard(label: 'Gst Tax',onPress: () {
             Get.toNamed(RoutesNames.gstList);

           },),
           MasterCard(label: 'ESIC Policy',onPress: () {
             Get.toNamed(RoutesNames.esicList);

           },),
           MasterCard(label: 'Bonus',onPress: () {
             Get.toNamed(RoutesNames.bonusList);

           },),
           MasterCard(label: 'Leave',onPress: () {
             Get.toNamed(RoutesNames.leaveList);

           },),

        ],
      ).paddingSymmetric(horizontal: 16.w)
      ,
    );
  }
}

class MasterCard extends StatelessWidget {
  const MasterCard({
    super.key,
    required this.label,
    required this.onPress
  });
  final VoidCallback onPress;
  final String  label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: CustomCard(
        radius: 6,
        blurRadius: 4,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: label,fontSize: FontSizes.mediuam,fontWeight: FontWeights.large,),
          const IconWidget(icon: Icons.arrow_forward_ios_rounded,size: 16,clr: AppColors.themeColor,)
        ],
      ).paddingSymmetric(vertical: 15.h,horizontal: 14.w),
      ),
    );
  }
}
