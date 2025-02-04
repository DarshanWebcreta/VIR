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
import 'package:vir/features/bonus/presentation/store/bonus_store.dart';
import 'package:vir/injection.dart';

import '../../../core/utils/validations.dart';

class BonusView extends StatefulWidget {
  const BonusView({super.key});

  @override
  State<BonusView> createState() => _BonusViewState();
}

class _BonusViewState extends State<BonusView> {
  final bonusValue = TextEditingController();
  final bonusStore = getIt<BonusStore>();
  String date = '';
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    bonusValue.dispose();
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
            bonusStore.addBonus({
              "bonus_value": bonusValue.text,
              "effective_date": date
            });
          }
        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar: const CustomAppBar(title: AppStrings.bonusView,backBtn: true,),
      body: SingleChildScrollView(
        child: Form(key: key,child: Column(
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),

            TextFieldWidget(controller: bonusValue,labelTxt: 'Bonus*',hintTxt: "Enter bonus value",validator: Validation.isEmpty,
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


