

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/key/storage_keys.dart';
import 'package:vir/core/storage/app_storage.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/category/presentation/store/category_store.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/quote/presentation/store/add_quote/add_new_quote_store.dart';
import 'package:vir/features/quote/presentation/store/quote_list/quote_store.dart';
import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';

import 'package:vir/injection.dart';
import 'package:vir/core/component/custom_checkBox.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/validations.dart';
class AddNewQuote extends StatefulWidget {
  final int? quoteId;
  const AddNewQuote({super.key, this.quoteId});

  @override
  State<AddNewQuote> createState() => _AddNewQuoteState();
}

class _AddNewQuoteState extends State<AddNewQuote> {
  final addQuoteStore = AddNewQuoteStore();
  final subject = getIt<SubjectStore>();
  final quote = getIt<QuoteStore>();
  final company = getIt<CompanyStore>();
  final category = getIt<CategoryStore>();
  final tc = getIt<TermsStore>();



  double spacePadding = 10.h;
  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {

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
      child:CustomButton(text:"Submit" , callback: () {
        var request = {
          "company_id": addQuoteStore.companyId,
          "user_id":StorageManager.readData(StoreKeys.userId),
          "subject_id": addQuoteStore.subjectId,
          "name":addQuoteStore.name.text,
          "phone_no": addQuoteStore.phone.text,
          "address": addQuoteStore.address.text,
          "address1": addQuoteStore.address1.text,
          "city": addQuoteStore.city.text,
          "district": addQuoteStore.dictrict.text,
          "pincode": addQuoteStore.pincode.text,
          "gst_no": addQuoteStore.gstNo.text,
          "email": addQuoteStore.email.text,
          "rate_hours": int.parse(addQuoteStore.rateHours.isEmpty?'0':addQuoteStore.rateHours),
          "status": addQuoteStore.status,
          "apply_cgst" :addQuoteStore.cGst?1:0,
          "apply_sgst":addQuoteStore.sGst?1:0,
          "apply_igst":addQuoteStore.iGst?1:0,
          "terms": addQuoteStore.selectedTerms,
          "categories":addQuoteStore.categories.map((category) => category.toJson()).toList(),
        };
        widget.quoteId==null ? quote.addQuote(request):quote.updateQuote(int.parse(widget.quoteId.toString()), request);
      },),).paddingAll(16.w),
      body: Observer(builder: (context) {


        return addQuoteStore.isLoading?const Center(child: CircularProgressIndicator(),):

        ListView(
          padding: EdgeInsets.all(FixSizes.paddingAllAndHorizontol),
          children: [

            FunctionalWidget.dropDownButton(
              label: "Company name*",
              title:addQuoteStore.companyId==0?"Select any Compnay":company.companyList.firstWhere((element) => element.id==addQuoteStore.companyId,).companyName,
              displayAddBtn: true,
              addTap: () {

              },
              onTap: () {
                FunctionalWidget.bottomSheet(height: 500, child:    ListView.builder(itemCount: company.companyList.length,itemBuilder: (context, index) {
                  final companyData =  company.companyList[index];
                  return Column(
                    children: [
                      CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:companyData.companyName, callback: () {
                        addQuoteStore.companyId=companyData.id;

                        Get.back();
                      },),
                      const Divider(),
                    ],
                  );
                },), title: AppStrings.companyTitle);

              },
            ),
            FunctionalWidget.dropDownButton(
              displayAddBtn: true,

              label: "Subject*",
              title:addQuoteStore.subjectId==0?"Select any subject":subject.subjectList.firstWhere((element) => element.id==addQuoteStore.subjectId,).name,
              addTap: () {

              },
              onTap: () {
                FunctionalWidget.bottomSheet(height: 500, child:
                ListView.builder(itemCount: subject.subjectList.length,itemBuilder: (context, index) {
                  final subjectData =  subject.subjectList[index];
                  return Column(
                    children: [
                      CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:subjectData.name, callback: () {
                        addQuoteStore.subjectId=subject.subjectList[index].id;

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
              controller: addQuoteStore.name,
              validator: Validation.email,
            ),
            TextFieldWidget(
              labelTxt: "Phone no*",
              hintTxt: "Phone no",
              filled: true,
              controller: addQuoteStore.phone, // Updated controller for address
              validator: Validation.email,
            ).paddingSymmetric(vertical: spacePadding),
            TextFieldWidget(
              labelTxt: "Address*",
              hintTxt: "Address",
              filled: true,
              controller: addQuoteStore.address, // Updated controller for address
              validator: Validation.email,
            ),
            TextFieldWidget(
              labelTxt: "Address1*",
              hintTxt: "Address1",
              filled: true,
              controller: addQuoteStore.address1, // Updated controller for address
              validator: Validation.email,
            ).paddingSymmetric(vertical: spacePadding),
            TextFieldWidget(
              labelTxt: "City*",
              hintTxt: "City",
              filled: true,
              controller: addQuoteStore.city,
              validator: Validation.email,
            ),
            TextFieldWidget(
              labelTxt: "District*",
              hintTxt: "District",
              filled: true,
              controller: addQuoteStore.dictrict,
              validator: Validation.email,
            ).paddingSymmetric(vertical: spacePadding),
            TextFieldWidget(
              labelTxt: "Pincode*",
              hintTxt: "Pincode",
              filled: true,
              controller: addQuoteStore.pincode,
              validator: Validation.email,
            ),
            TextFieldWidget(
              labelTxt: "Gst no*",
              hintTxt: "Gst no",
              filled: true,
              controller: addQuoteStore.gstNo,
              validator: Validation.email,
            ).paddingSymmetric(vertical: spacePadding),
            TextFieldWidget(
              labelTxt: "Email*",
              hintTxt: "Email",
              filled: true,
              controller: addQuoteStore.email,
              validator: Validation.email,
            ),
            FunctionalWidget.dropDownButton(
              label: "Status",
              title:addQuoteStore.status.isEmpty?"Select status":addQuoteStore.status,
              addTap: () {

              },
              onTap: () {
                FunctionalWidget.bottomSheet(height: 500, child:
                ListView.builder(itemCount: AppStrings.status.length,itemBuilder: (context, index) {
                  final status =  AppStrings.status[index];
                  return Column(
                    children: [
                      CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:status, callback: () {
                        addQuoteStore.status=status;

                        Get.back();
                      },),
                      const Divider(),
                    ],
                  );
                },), title: "Status");
              },
            ),
            FunctionalWidget.dropDownButton(
              label: "Rate hours*",
              title:addQuoteStore.rateHours.isEmpty?"Select any hours":"${addQuoteStore.rateHours} hrs",
              addTap: () {

              },
              onTap: () {
                FunctionalWidget.bottomSheet(height: 500, child:
                ListView.builder(itemCount: AppStrings.rateHours.length,itemBuilder: (context, index) {
                  final rate =  AppStrings.rateHours[index];
                  return Column(
                    children: [
                      CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:rate, callback: () {
                        addQuoteStore.rateHours=rate;

                        Get.back();
                      },),
                      const Divider(),
                    ],
                  );
                },), title: "Rate Hours");
              },
            ).paddingSymmetric(vertical: spacePadding),
            CustomCard(color: AppColors.white,child:

            ListView.builder(padding: EdgeInsets.symmetric(vertical: 10.h),physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: addQuoteStore.categories.length,itemBuilder: (context, index) {
              final categoryData = addQuoteStore.categories[index];
              final pivot = addQuoteStore.categories[index].pivot;
              return Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  FunctionalWidget.dropDownButton(label: "Select Category", title:categoryData.pivot.categoryId!=0?category.categoryList.firstWhere((element) => element.id==categoryData.pivot.categoryId,).name: "Category", onTap: () {
                    FunctionalWidget.bottomSheet(height: 500.h, child: ListView.builder(itemCount: category.categoryList.length,itemBuilder: (context, indeX) {
                      final categoryValue = category.categoryList[indeX];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text:categoryValue.name, callback: () {
                            addQuoteStore.selectCategory(index: index, categoryId: categoryValue.id);
                        //    categoryData.pivot.categoryId =categoryValue.id ;

                            Get.back();
                          },),
                          const Divider(),
                        ],
                      );
                    },), title: "Select category");
                  },),
                  Row(
                    children: [
                       Expanded(child: TextFieldWidget(controller:pivot.wages,inputFormater: [
                         FilteringTextInputFormatter.digitsOnly
                       ],textinput: TextInputType.number ,hintTxt: "Wages",validator: Validation.isEmpty,)),
                      Expanded(child:  TextFieldWidget(hintTxt: "Allowances",inputFormater: [
                      FilteringTextInputFormatter.digitsOnly
                      ],textinput: TextInputType.number,controller:pivot.allowance,validator: Validation.isEmpty).paddingOnly(left: 6.w)),
                    ],
                  ),
                  TextFieldWidget(controller:pivot.hraCharge ,hintTxt: "HRA Charge",inputFormater: [
              FilteringTextInputFormatter.digitsOnly
              ],textinput: TextInputType.number,validator:Validation.isEmpty,suffix: CheckBoxWidget(value: pivot.applyPercentageForHra==1?true:false,  callback: () {
                    addQuoteStore.applyHRA(index: index);

                  },),),
                  TextFieldWidget(controller:pivot.agencyCharge,hintTxt: "Agency Service Charge",inputFormater: [
                    FilteringTextInputFormatter.digitsOnly
                  ],textinput: TextInputType.number,validator:Validation.isEmpty,suffix: CheckBoxWidget(value:  pivot.applyPercentageForAgency==1?true:false,  callback: () {
                    addQuoteStore.applyAgency(index: index);

                  },),),

                  Wrap(
                      direction: Axis.horizontal,
                      textDirection: TextDirection.ltr,
                      spacing: 14.w,
                      runSpacing: 10.h,


                      children:[
                        CheckBoxWidget(value:pivot.hra==1?true:false ,label:"HRA", callback: () {
                          addQuoteStore.allSinglePolicy(val: 0,index: index );

                        },),

                        CheckBoxWidget(value:pivot.proFund==1?true:false,label: "Provident fund", callback: () {
                          addQuoteStore.allSinglePolicy(val: 1,index: index);

                        },),

                        CheckBoxWidget(value: pivot.esic==1?true:false,label: "ESIC Policy", callback: () {
                          addQuoteStore.allSinglePolicy(val: 2,index: index);

                        },),

                        CheckBoxWidget(value:pivot.bonus==1?true:false,label: "Bonus", callback: () {
                          addQuoteStore.allSinglePolicy(val: 3,index: index);

                        },),

                        CheckBoxWidget(value:pivot.leave==1?true:false,label: "Leave", callback: () {
                          addQuoteStore.allSinglePolicy(val: 4,index: index);

                        },),

                      ]
                  ).paddingSymmetric(vertical: 6.h),

                  if(index!=0)   Align(
                    alignment: Alignment.centerRight,
                    child: CustomSizeBox(height: 40, width: 80,child: CustomButton(
                         borderClr: AppColors.themeColor,color: AppColors.transparent,fontClr: AppColors.themeColor,
                         text: "Remove", callback: () {
                      addQuoteStore.removeCategory(index: index);

                       },),),
                  ),

                  const Divider(),
                 if(index==addQuoteStore.categories.length-1) Align(
                   alignment: Alignment.centerRight,
                   child: CustomSizeBox(height: 40, width: 80,child: CustomButton(text: "Add", callback: () {
                     addQuoteStore.addCategory();
                    },),),
                 ),
                ],
              ).paddingOnly(top: 10.h,right: 12.w,left: 12.w);
            },),),
            Row(
              spacing: 10.w,
              children: [
                CheckBoxWidget(callback: () {
                  addQuoteStore.setCgst();

                },label:"CGST" ,value:addQuoteStore. cGst,fontWeight: FontWeights.medium,fontSize: 14,size: 18,),

                CheckBoxWidget(callback: () {
                  addQuoteStore.setSgst();

                },label:"SGST" ,value:addQuoteStore. sGst,fontWeight: FontWeights.medium,fontSize: 14,size: 18,),

                CheckBoxWidget(callback: () {
                  addQuoteStore.setIgst();
                },label:"IGST" ,value:addQuoteStore. iGst,fontWeight: FontWeights.medium,fontSize: 14,size: 18,),

              ],
            ).paddingOnly(top: 20.h,bottom: 10.h),
            CheckBoxWidget(callback: () {
              addQuoteStore.selectAllTerms();
            },label:"Select All Terms and Conditions" ,value:addQuoteStore. selectedTerms.length ==tc.termsList.length,fontWeight: FontWeights.medium,).paddingOnly(top: 10.h),
           ListView.builder(physics: const NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,itemCount: tc.termsList.length,shrinkWrap: true,itemBuilder: (context, index) {
             final terms = tc.termsList[index];

             /// View navo thai jaay like aama itembuilder aayu and context change thgai gayu atle ke new thai gayu atle aama observer add karvuj pade under
             return Observer(builder: (context) => CheckBoxWidget(fullTitle: true,callback: () {

               addQuoteStore.selectTerms(id: terms.id.toString());
             },label: terms.title ,value: addQuoteStore.selectedTerms.contains(terms.id.toString())?true:false,),).paddingOnly(bottom: 4.h);
           },).paddingSymmetric(vertical: 10.h),
            CheckBoxWidget(callback: () {
              addQuoteStore.setSendEmail();
            },label:"Send email" ,value: addQuoteStore.sendEmail,fontWeight: FontWeights.medium,).paddingOnly(bottom: 60.h),

          ],
        );
      })

      );
  }

}


