
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/profile/presentation/store/profile_store.dart';
import 'package:vir/injection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileStore = getIt<ProfileStore>();
  final currentPass = TextEditingController();
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  @override
  void initState() {
    profileStore.fetchProfile();
    // TODO: implement initState
    super.initState();
  }
  final profileKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  @override
  void dispose() {
    currentPass.dispose();
    oldPass.dispose();
    newPass.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: Observer(builder: (context) {
        final profileData = profileStore.profileModel?.data;
        return RefreshIndicator(
          onRefresh: () => profileStore.fetchProfile(),
          child: ListView(
                    children: [
          Form(
            key: profileKey,

            child: cardWidget(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(text: "Profile Details",fontSize: FontSizes.large,fontWeight: FontWeights.large,).paddingOnly(bottom: 16.h),
                TextFieldWidget(controller: profileData?.fullName,labelTxt: "User name*",hintTxt: "Enter user name",validator: Validation.isEmpty,).paddingOnly(bottom: 6.h),
                TextFieldWidget(controller: profileData?.email,labelTxt: "Email*",hintTxt: "Enter email ",validator: Validation.email,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 6.w,
                  children: [
                    // CustomButton(borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,text: "Discard", callback: () {
                    //
                    // },horiZontalPadding: 15,vertiCalPadding: 6,),
                    CustomButton(text: "Save", callback: () {
                      if(profileKey.currentState!.validate()){
                        profileStore.updateProfile({
                          "name":profileData?.fullName.text,
                          "email": profileData?.email.text
                        });
                      }
                    },horiZontalPadding: 15,vertiCalPadding: 6,),

                  ],
                ).paddingOnly(top: 18.h),

              ],
            ))
                .paddingOnly(top: 24.h,bottom: 12.h),
          ),

          Form(
            key: passwordKey,
            child: cardWidget(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(text: "Update Password",fontSize: FontSizes.large,fontWeight: FontWeights.large,).paddingOnly(bottom: 16.h),
                 TextFieldWidget(controller: currentPass,labelTxt: "Current Password*",hintTxt: "Enter password",validator: Validation.isEmpty,).paddingOnly(bottom: 10.h),
                 TextFieldWidget(controller: oldPass,labelTxt: "New Password*",hintTxt: "Enter New password ",validator: Validation.isEmpty,).paddingOnly(bottom: 10.h),
                 TextFieldWidget(controller: newPass,labelTxt: "Confirm New Password*",hintTxt: "Enter New password ",validator:(p0) {
                   if(p0!.isEmpty){
                     return 'required field';
                   }
                   else if(p0!=oldPass.text){
                     FunctionalWidget.showSnackBar(title: "Password does not match", success: false);
                     return '';

                   }
                   return null;
                 } ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 6.w,
                  children: [
                    // CustomButton(borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,text: "Discard", callback: () {
                    //
                    // },horiZontalPadding: 15,vertiCalPadding: 6,),
                    CustomButton(text: "Save", callback: () {
                      if(passwordKey.currentState!.validate()){

                      }
                    },horiZontalPadding: 15,vertiCalPadding: 6,),

                  ],
                ).paddingOnly(top: 18.h),

              ],
            )),
          ),



                    ],
                  ),
        );
      },),
    );
  }

  CardWidget cardWidget({required Widget child}) {
    return CardWidget(horiZontalPadding: FixSizes.paddingAllAndHorizontol, verticalPadding: 12.h, child: child);
  }
}
