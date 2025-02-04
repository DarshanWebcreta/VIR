
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
import 'package:vir/features/category/domain/entities/category_data.dart';
import 'package:vir/features/category/presentation/store/category_store.dart';
import 'package:vir/injection.dart';

import '../../core/utils/validations.dart';

class CategoryView extends StatefulWidget {

  final MasterData? categoryData;
  const CategoryView({super.key,this.categoryData});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final categoryName = TextEditingController();
  final category = getIt<CategoryStore>();
  final key  = GlobalKey<FormState>();

  bool enable =true;
  @override
  void dispose() {
    categoryName.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    categoryName.text = widget.categoryData?.name??'';
    if(widget.categoryData!=null) {
      setState(() {
        enable = widget.categoryData?.status == 'enable' ? true : false;
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
        if(key.currentState!.validate()){
          if(widget.categoryData==null){
            category.addCategory({
              "name": categoryName.text,
              "status": enable?"enable":'disable'
            });
          }
          else{
            category.updateCategory(widget.categoryData!.id, {
              "name": categoryName.text,
              "status": enable?"enable":'disable'
            });

          }
        }
      },).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar:  CustomAppBar(title: widget.categoryData==null?AppStrings.categoryAddTitle:AppStrings.categoryViewTitle,backBtn: true,),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children:  [
            const CustomSizeBox(height: 8, width: 0),

            TextFieldWidget(validator: Validation.isEmpty,controller: categoryName,labelTxt: 'Name*',hintTxt: "Enter caetgory name",),
            EnableDisableStatus(callback: () {
              setState(() {
                enable = !enable;
              });
            },enable: enable,)


          ],
        )).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );

  }


}




