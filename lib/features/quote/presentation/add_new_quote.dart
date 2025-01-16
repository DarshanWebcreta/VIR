import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/compnay_list_sheet.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/quote/presentation/store/add_quote/add_new_quote_store.dart';
import 'package:vir/features/subject/presentation/store/subject_store.dart';

import 'package:vir/injection.dart';
import 'package:vir/core/component/custom_checkBox.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/quote/domain/entities/policies_value.dart';
class AddNewQuote extends StatefulWidget {
  final int? quoteId;
  const AddNewQuote({super.key, this.quoteId});

  @override
  State<AddNewQuote> createState() => _AddNewQuoteState();
}

class _AddNewQuoteState extends State<AddNewQuote> {
  final addQuoteStore = getIt<AddNewQuoteStore>();
  final subject = getIt<SubjectStore>();



  double spacePadding = 10.h;
  @override
  void dispose() {

    addQuoteStore.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    company.selectedCompanyId = 0;
    company.selectedCompanyName = '';
    if(widget.quoteId!=null) {

      addQuoteStore.fetchQuote(id: widget.quoteId!);
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: "Quote",backBtn: true,),
      bottomNavigationBar: CustomSizeBox(height: 50.h, width: FixSizes.fullWidth,
      child: CustomButton(text:"Submit" , callback: () {

      },),).paddingAll(16.w),
      body: Observer(builder: (context) {

        final data = addQuoteStore.quoteViewModel?.data;
        if(data==null&&widget.quoteId!=null){
          return const CircularProgressIndicator();
        }
        else{
          return addQuoteStore.isLoading?const Center(child: CircularProgressIndicator(),):ListView(
            padding: EdgeInsets.all(FixSizes.paddingAllAndHorizontol),
            children: [

              FunctionalWidget.dropDownButton(
                label: "Company name*",
                title:data?.companyName??'Company name',
                displayAddBtn: true,
                addTap: () {

                },
                onTap: () {
                  FunctionalWidget.bottomSheet(height: 500, child: const CompanyLists(), title: AppStrings.companyTitle);

                },
              ),
              FunctionalWidget.dropDownButton(
                displayAddBtn: true,

                label: "Subject*",
                title: data?.subjectName??'Subject name',
                addTap: () {

                },
                onTap: () {
                  FunctionalWidget.bottomSheet(height: 500, child:ListView.builder(itemCount: subject.subjectList.length,itemBuilder: (context, index) {
                    final subjectData =  subject.subjectList[index];
                    return Column(
                      children: [
                        CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:subjectData.name, callback: () {
                          addQuoteStore.changeSubject(id:subjectData.id,subjectName: subjectData.name,data: data! ,);

                          Get.back();
                        },),
                        const Divider(),
                      ],
                    );
                  },), title: AppStrings.companyTitle);

                },
              ).paddingSymmetric(vertical: spacePadding),
              TextFieldWidget(
                labelTxt: "Name*",
                hintTxt: "Name",
                filled: true,
                controller:data?.name ,
                validator: Validation.email,
              ),
              TextFieldWidget(
                labelTxt: "Address*",
                hintTxt: "Address",
                filled: true,
                controller: data?.address, // Updated controller for address
                validator: Validation.email,
              ),
              TextFieldWidget(
                labelTxt: "Address1*",
                hintTxt: "Address1",
                filled: true,
                controller: data?.address1, // Updated controller for address
                validator: Validation.email,
              ).paddingSymmetric(vertical: spacePadding),
              TextFieldWidget(
                labelTxt: "City*",
                hintTxt: "City",
                filled: true,
                controller: data?.city,
                validator: Validation.email,
              ),
              TextFieldWidget(
                labelTxt: "Pincode*",
                hintTxt: "Pincode",
                filled: true,
                controller: data?.pincode,
                validator: Validation.email,
              ).paddingSymmetric(vertical: spacePadding),
              TextFieldWidget(
                labelTxt: "Email*",
                hintTxt: "Email",
                filled: true,
                controller: data?.email,
                validator: Validation.email,
              ),
              FunctionalWidget.dropDownButton(
                label: "Rate hours*",
                title: "Select rate",
                addTap: () {

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
          );
        }

      })

      );
  }

}


