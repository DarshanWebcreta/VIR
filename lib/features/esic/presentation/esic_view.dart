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
import 'package:vir/features/esic/presentation/store/esic_store.dart';
import 'package:vir/features/provident_fund/presentation/store/pf_store.dart';
import 'package:vir/injection.dart';

class EsicView extends StatefulWidget {

  const EsicView({super.key,});

  @override
  State<EsicView> createState() => _EsicViewState();
}

class _EsicViewState extends State<EsicView> {
  final esicValue = TextEditingController();
  final esicStore = getIt<EsicStore>();
  String date = '';
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    esicValue.dispose();
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
            esicStore.addEsic({
              "esic_policy_value": esicValue.text,
              "effective_date": date
            });
          }
        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar: const CustomAppBar(title: AppStrings.esicView,backBtn: true,),
      body: SingleChildScrollView(
        child: Form(key: key,child: Column(
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),

            TextFieldWidget(controller: esicValue,labelTxt: 'Esic Policy*',hintTxt: "Add esic policy here",validator: Validation.isEmpty,
              inputFormater: [
                FilteringTextInputFormatter.digitsOnly
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


