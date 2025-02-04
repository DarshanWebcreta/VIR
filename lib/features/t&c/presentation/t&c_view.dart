
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/enable_disable.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';
import 'package:vir/injection.dart';

class TcView extends StatefulWidget {
  final MasterData? masterData;
  const TcView({super.key,this.masterData});

  @override
  State<TcView> createState() => _TcViewState();
}

class _TcViewState extends State<TcView> {
  final termsStore = getIt<TermsStore>();
  final title = TextEditingController();
  final sorting = TextEditingController();
  bool status = true;
  @override
  void dispose() {
    title.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    if(widget.masterData!=null){
      title.text = widget.masterData?.title??'';
      sorting.text = "${widget.masterData?.sortOrder??1}";
      status = widget.masterData?.status=='enable'?true:false;
      setState(() {

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
        if(widget.masterData==null){
          termsStore.addTerm(request());
        }
        else{

          termsStore.updateTerm(widget.masterData!.id, request());

        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar:  CustomAppBar(title: widget.masterData==null?AppStrings.tcViewTitle:AppStrings.tcViewUpdateTitle,backBtn: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),
             TextFieldWidget(controller: title,hintTxt: "Title",labelTxt: "Title*",validator: Validation.isEmpty,),
             TextFieldWidget(controller: sorting,hintTxt: "Add a value for sorting",labelTxt: "Sort Order*",validator: Validation.isEmpty,
               textinput: TextInputType.number,
               inputFormater: [
                FilteringTextInputFormatter.digitsOnly

               ],),
            EnableDisableStatus(enable: status,callback: () {
              setState(() {
                status = !status;
              });
            },)


          ],
        ).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );

  }

  Map<String, Object> request() {
    return {
          "title": title.text,
          "sort_order":int.parse( sorting.text),
          "status": status?"enable":"disable"
        };
  }
}


