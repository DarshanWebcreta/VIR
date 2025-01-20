


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vir/core/component/app_logo.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/auth/presentation/login/store/login_store.dart';


import '../../../../../core/utils/function_component.dart';
import '../../../../injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        loginSheet();
      });
    });
  }


  Future<dynamic> loginSheet() {
    return FunctionalWidget.bottomSheet(barrierClr: AppColors.transparent,height: 320,canPop: false,child: Form(
      key:key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWidget(

            controller: email,
            hintTxt: "Email address",
            validator: Validation.email,
            filled: true,

          ),
          TextFieldWidget(
            controller: pass,
            validator: Validation.pass,

            hintTxt: "Password",
            filled: true,
          ).paddingOnly(top: FixSizes.paddingVertical, bottom: 12.h),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap:() {
                  Get.toNamed(RoutesNames.forgetPassword);
                } ,
                child: const TextWidget(
                  text: AppStrings.forgetPassword,
                  fontSize: FontSizes.small,
                  fontWeight: FontWeights.medium,
                  clr: AppColors.brinjalClr,
                ),
              )),
          const Spacer(),
          Center(
            child: CustomSizeBox(
                height: FixSizes.buttonHeight,
                width: 800,
                child: CustomButton(
                  text: AppStrings.submit,
                  callback: () {
                    if(key.currentState!.validate()){
                      getIt<LoginStore>().login(loginRowData: {"email":email.text.trim(),"password":pass.text.trim()});

                    }
                  },
                )).paddingOnly(top: 30.h),
          )
        ],
      ),
    ), title: AppStrings.loginSheetTitle,descriptrion: AppStrings.loginSheetDesciption,isDismissible: false);

  }
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogo().paddingOnly(top: 180.h),
          ],
        ),
      ),
    );
  }
}
