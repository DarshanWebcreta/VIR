import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/circle_button.dart';
import 'package:vir/core/component/custom_button.dart';

import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/svg_widget.dart';

import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/key/image_keys.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/auth/presentation/forget_password/store/forget_password_store.dart';

import '../../../../injection.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController email = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconButton(size: 5,iconSize: 18,backgroundColor: AppColors.lightGrey,iconColor: AppColors.grey,icon: Icons.arrow_back_ios_new, onPressed: () {
            Get.back();
          },),
        ),
        backgroundColor: AppColors.transparent,
        title: const TextWidget(text: "Forget password",fontWeight: FontWeights.large,fontSize: FontSizes.large,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SvgWidget(path: ImageStrings.forgetPassword,height: 100,width: 200,),
                const TextWidget(text: AppStrings.forgetPasswordDescription,
                  textAlign: TextAlign.center,maxLine: 5,fontWeight:FontWeights.medium,).paddingOnly(
                    top: 12.h,bottom: 70.h
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(text: AppStrings.registerEmailAddress,
                    textAlign: TextAlign.center,maxLine: 5,fontWeight:FontWeights.medium,clr: AppColors.grey,),
                ),
                TextFieldWidget(controller: email,hintTxt: "xyz@gmail.com",
                  validator: Validation.email,
                ).paddingOnly(top: 12.h,bottom: 50.h),
                CustomSizeBox(height: FixSizes.buttonHeight, width: 146, child:  CustomButton(text:AppStrings.submit, callback: () {
                  if(key.currentState!.validate()){
                    getIt<ForgetPasswordStore>().forgetPassword(loginRowData: {'email':email.text});
                  }
                },))
              ],
            ).paddingSymmetric(horizontal: FixSizes.paddingAllAndHorizontol),
          ),
        ),
      ),
    );
  }
}
