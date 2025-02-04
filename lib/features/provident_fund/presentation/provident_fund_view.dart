import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/provident_fund/presentation/store/pf_store.dart';
import 'package:vir/injection.dart';

class ProvidentFundView extends StatefulWidget {

  const ProvidentFundView({super.key,});

  @override
  State<ProvidentFundView> createState() => _ProvidentFundViewState();
}

class _ProvidentFundViewState extends State<ProvidentFundView> {
 final pfValue = TextEditingController();
  final pfStore = getIt<PfStore>();
  String date = '';
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    pfValue.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomButton(height: 52,text: "Submit", callback: () {
        if(key.currentState!.validate()){
         if(date.isEmpty){
           FunctionalWidget.showSnackBar(title: "Please select any date", success: false);
         }
         else{
           pfStore.addPf({
             "pro_fund_value": pfValue.text,
             "effective_date": date
           });
         }
        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar: const CustomAppBar(title: AppStrings.providentFundViewTitle,backBtn: true,),
      body: SingleChildScrollView(
        child: Form(key: key,child: Column(
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),

             TextFieldWidget(controller: pfValue,labelTxt: 'Provident Fund*',hintTxt: "Add provident fund here",validator: Validation.isEmpty,
                 inputFormater: [
                   FilteringTextInputFormatter.allow(Validation.addDigitOnly),
                 ],textinput: TextInputType.number,),
            FunctionalWidget.dropDownButton(
              label: 'Effective Date*',
              title:Operation. titleSet(
                date: date,
                defaultValue: "Select Date",
              ),
              onTap: () async {
                DateTime? time =
                await Operation.getDate(startDate: date,endDate: false);
                if (time != null) {
                  date =
                      DateFormat('yyyy-MM-dd').format(time);
                  setState(() {

                  });
                }
              },
            ).paddingSymmetric(vertical: 10.h),


          ],
        )).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );

  }
}


