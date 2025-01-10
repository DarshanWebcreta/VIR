import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/fix_sizes.dart';

class ProvidentFundView extends StatefulWidget {
  const ProvidentFundView({super.key});

  @override
  State<ProvidentFundView> createState() => _ProvidentFundViewState();
}

class _ProvidentFundViewState extends State<ProvidentFundView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomButton(height: 52,text: "Submit", callback: () {

      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar: const CustomAppBar(title: AppStrings.providentFundViewTitle,backBtn: true,),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10.h,
          children: const [
            CustomSizeBox(height: 8, width: 0),

            TextFieldWidget(labelTxt: 'Name*',hintTxt: "Enter name",),

          ],
        ).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );

  }
}


