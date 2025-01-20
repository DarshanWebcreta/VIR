
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/enable_disable.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';

import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/injection.dart';



class SubjectView extends StatefulWidget {

  final MasterData? subjectData;
  const SubjectView({super.key,this.subjectData});

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  final subjectName = TextEditingController();
  final subject = getIt<SubjectStore>();
  bool enable =true;
  @override
  void dispose() {
    subjectName.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    subjectName.text = widget.subjectData?.name??'';
    if(widget.subjectData!=null) {
      setState(() {
        enable = widget.subjectData?.status == 'enable' ? true : false;
      });
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomButton(height: 52,text: "Submit", callback: () {
        if(widget.subjectData==null){
          subject.addSubject({
            "name": subjectName.text,
            "status": enable?"enable":'disable'
          });
        }
        else{
          subject.updateSubject(widget.subjectData!.id, {
            "name": subjectName.text,
            "status": enable?"enable":'disable'
          });

        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar:  CustomAppBar(title: "${widget.subjectData == null ? "Add " : ""}${AppStrings.subjectViewTitle}",
        backBtn: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),

             TextFieldWidget(validator: Validation.isEmpty,controller: subjectName,labelTxt: 'Name*',hintTxt: "Enter caetgory name",),
            EnableDisableStatus(callback: () {
              setState(() {
                enable = !enable;
              });
            },enable: enable,)


          ],
        ).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );

  }


}




