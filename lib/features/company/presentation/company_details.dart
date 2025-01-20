import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_field_widget.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/secrets/api_strings.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/validations.dart';
import 'package:vir/features/company/domain/entities/company_data.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/injection.dart';

class CompanyDetails extends StatefulWidget {
  final CompanyData? companyData;
  const CompanyDetails({super.key, this.companyData});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  final addCompany = getIt<CompanyStore>();
  final nameController = TextEditingController();
  final regController = TextEditingController();
  final pfController = TextEditingController();
  final stController = TextEditingController();
  final gstController = TextEditingController();
  final ptController = TextEditingController();
  final pnController = TextEditingController();
  final gujPoliceNo = TextEditingController();
  final rjPoliceNo = TextEditingController();
  final panNo = TextEditingController();
  final key = GlobalKey<FormState>();
   File ? imageFile;
  @override
  void dispose() {
    nameController.dispose();
    regController.dispose();
    pfController.dispose();
    stController.dispose();
    gstController.dispose();
    ptController.dispose();
    pnController.dispose();
    gujPoliceNo.dispose();
    rjPoliceNo.dispose();
    panNo.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    nameController.text = widget.companyData?.companyName ?? '';
    regController.text = widget.companyData?.registrationNo ?? '';
    pnController.text = widget.companyData?.policeNo ?? '';
    stController.text = widget.companyData?.serviceTaxNo ?? '';
    gstController.text = widget.companyData?.serviceTaxNo ?? '';
    ptController.text = widget.companyData?.profTaxNo ?? '';
    pfController.text = widget.companyData?.providentFundNo ?? '';
    rjPoliceNo.text = widget.companyData?.rjPoliceNo ?? '';
    gujPoliceNo.text = widget.companyData?.gujPoliceNo ?? '';
    panNo.text = widget.companyData?.panNo ?? '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomButton(
        height: 52,
        text: "Submit",
        callback: () {
          if (key.currentState!.validate()) {

              addCompany.addUpdateCompany(
                  id:widget.companyData?.id,
                  update:widget.companyData==null? false:true,
                  companyName: nameController.text,
                  pfNo: pfController.text,
                  regNo: regController.text,
                  serTax:stController.text ,
                  gstNo: gstController.text,
                  profTax:gstController.text,
                  panNo: panNo.text,
                  gujPoliceNo: gujPoliceNo.text,
                  rjPoliceNo: rjPoliceNo.text,
                 logo: imageFile

                  );


          }
        },
      ).paddingAll(FixSizes.paddingAllAndHorizontol.w),
      appBar:  CustomAppBar(
        title: "${widget.companyData == null ? "Add " : ""}${AppStrings.companyDetails}",
        backBtn: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                const CustomSizeBox(height: 8, width: 0),
                TextFieldWidget(
                  controller: nameController,
                  labelTxt: 'Name*',
                  hintTxt: "Enter name",
                  validator: Validation.isEmpty,
                ),
                TextFieldWidget(
                  controller: regController,
                  labelTxt: 'Registration No*',
                  hintTxt: "Enter registration no",
                  validator: Validation.isEmpty,
                ),
                TextFieldWidget(
                    controller: pfController,
                    labelTxt: 'Provident Fund*',
                    hintTxt: "Enter provident fund",
                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: stController,
                    labelTxt: 'Service Tax No*',
                    hintTxt: "Enter service tax no",
                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: gstController,
                    labelTxt: 'GST No*',
                    hintTxt: "Enter gst no",
                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: ptController,
                    labelTxt: 'Prof Tax No*',
                    hintTxt: "Enter prof tax no",
                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: panNo,
                    labelTxt: 'Pan No*',
                    hintTxt: "Enter pan no",

                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: gujPoliceNo,
                    labelTxt: 'Gujarat police No*',
                    hintTxt: "Enter gujarat police no",
                    textinput: TextInputType.number,
                    inputFormater: [
                      FilteringTextInputFormatter.digitsOnly,

                    ],
                    validator: Validation.isEmpty),
                TextFieldWidget(
                    controller: rjPoliceNo,
                    labelTxt: 'Rajasthan Police No*',
                    hintTxt: "Enter rajasthan police no",
                    textinput: TextInputType.number,
                    inputFormater: [
                      FilteringTextInputFormatter.digitsOnly,

                    ],
                    validator: Validation.isEmpty),
                CustomSizeBox(
                  height: 60,
                  width: 0,
                  child: CustomButton(
                    text: '📂 Upload Logo',
                    callback: () async{
                      ImagePicker picker =
                      ImagePicker();
                      var pickedFile =
                          await picker.pickImage(
                          source:
                          ImageSource.gallery,imageQuality: 20);

                      if (pickedFile != null) {
                        imageFile = File(pickedFile.path);
                        setState(() {

                        });
                      }
                    },
                  ),
                ),

                if(imageFile!=null||widget.companyData?.logo!=null)Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(height:80.h,width: 100.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),image: DecorationImage(fit: BoxFit.cover,image: imageFile!=null?FileImage(File(imageFile!.path)):NetworkImage("${ApiStrings.imageUrl}${widget.companyData?.logo??''}"))),)
                    ,if(imageFile!=null)GestureDetector(
                      onTap: () {

                        setState(() {
                          imageFile = null;
                        });
                      },
                        child: CircleAvatar(backgroundColor: AppColors.themeColor,radius: 10,child: Icon(Icons.close,size: 14.w,color: Colors.white,),))
                  ],
                ),
                const CustomSizeBox(height: 60, width: 0)
              ],
            )).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );
  }
}
