import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/add_quote/presentation/store/add_new_quote_store.dart';
import 'package:vir/injection.dart';
import 'package:vir/core/component/custom_checkBox.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/add_quote/domain/entities/policies_value.dart';
class AddNewQuote extends StatefulWidget {
  const AddNewQuote({super.key});

  @override
  State<AddNewQuote> createState() => _AddNewQuoteState();
}

class _AddNewQuoteState extends State<AddNewQuote> {
  final addQuoteStore = getIt<AddNewQuoteStore>();


  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  double spacePadding = 10.h;
  @override
  void dispose() {

    addQuoteStore.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: "Quote",backBtn: true,),
      bottomNavigationBar: CustomSizeBox(height: 50.h, width: FixSizes.fullWidth,
      child: Observer(builder: (context) =>  CustomButton(text:addQuoteStore.tabFirst==0?"Next":"Submit" , callback: () {

      },),),).paddingAll(16.w),
      body: Observer(builder: (context) =>ListView(
        padding: EdgeInsets.all(FixSizes.paddingAllAndHorizontol),
        children: [

          FunctionalWidget.dropDownButton(
            label: "Company name*",
            title: "Company name*",
            displayAddBtn: !addQuoteStore.companyAdd,
            addTap: () {
              addQuoteStore.addCompany();
            },
            onTap: () {},
          ),
          FunctionalWidget.dropDownButton(
            displayAddBtn: !addQuoteStore.subjectAdd,

            label: "Subject*",
            title: "Subject",
            addTap: () {
              addQuoteStore.addSubject();
            },
            onTap: () {},
          ).paddingSymmetric(vertical: spacePadding),
          TextFieldWidget(
            labelTxt: "Name*",
            hintTxt: "Name",
            filled: true,
            controller: name,
            validator: Validation.email,
          ),
          TextFieldWidget(
            labelTxt: "Address*",
            hintTxt: "Address",
            filled: true,
            controller: address, // Updated controller for address
            validator: Validation.email,
          ).paddingSymmetric(vertical: spacePadding),
          TextFieldWidget(
            labelTxt: "City*",
            hintTxt: "City",
            filled: true,
            controller: name,
            validator: Validation.email,
          ),
          TextFieldWidget(
            labelTxt: "Pincode*",
            hintTxt: "Pincode",
            filled: true,
            controller: name,
            validator: Validation.email,
          ).paddingSymmetric(vertical: spacePadding),
          TextFieldWidget(
            labelTxt: "Email*",
            hintTxt: "Email",
            filled: true,
            controller: name,
            validator: Validation.email,
          ),
          FunctionalWidget.dropDownButton(
            label: "Rate hours*",
            title: "Select rate",
            addTap: () {
              addQuoteStore.addSubject();
            },
            onTap: () {},
          ).paddingSymmetric(vertical: spacePadding),
          CustomCard(color: AppColors.white,child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              FunctionalWidget.dropDownButton(label: "Select Category", title: "Category", onTap: () {

              },),
              Row(
                children: [
                  const Expanded(child: TextFieldWidget(hintTxt: "Wages",)),
                  Expanded(child: const TextFieldWidget(hintTxt: "Allowances",).paddingOnly(left: 6.w)),
                ],
              ),
              TextFieldWidget(hintTxt: "HRA Charge",suffix: CheckBoxWidget(value: false,  callback: () {

              },),),
              TextFieldWidget(hintTxt: "Agency Service Charge",suffix: CheckBoxWidget(value: false,  callback: () {

              },),),

              Wrap(
                direction: Axis.horizontal,
                textDirection: TextDirection.ltr,
                spacing: 14.w,
                runSpacing: 10.h,


                children:policies.map((e) => CheckBoxWidget(value: e.value,label: e.title, callback: () {

                },),).toList()
              ).paddingSymmetric(vertical: 6.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSizeBox(height: 40, width: 80,child: CustomButton(
                    borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,
                    text: "Remove", callback: () {

                  },),),
                  CustomSizeBox(height: 40, width: 80,child: CustomButton(text: "Add", callback: () {

                  },),)
                .paddingOnly(left: 10.w)
                ],
              )

            ],
          ).paddingSymmetric(vertical: 18.h,horizontal: 10.w),).paddingSymmetric(vertical: 10.h),

          CheckBoxWidget(callback: () {

          },label:"Select All Terms and Conditions" ,value: false,fontWeight: FontWeights.medium,).paddingOnly(top: 10.h),
          ListView.builder(physics: const NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,itemCount: policies.length,shrinkWrap: true,itemBuilder: (context, index) {
            return CheckBoxWidget(callback: () {

            },label: policies[index].title ,value: policies[index].value,).paddingOnly(bottom: 4.h);
          },).paddingSymmetric(vertical: 10.h),
          CheckBoxWidget(callback: () {

          },label:"Send email" ,value: false,fontWeight: FontWeights.medium,).paddingOnly(bottom: 60.h),

        ],
      ))

      );
  }

}


