import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/injection.dart';

class CompanyLists extends StatefulWidget {

   const CompanyLists({super.key});

  @override
  State<CompanyLists> createState() => _CompanyListsState();
}

class _CompanyListsState extends State<CompanyLists> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final companyList = getIt<CompanyStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(itemCount: companyList.companyList.length,itemBuilder: (context, index) {
        return Column(
          children: [
            CustomButton(borderClr: AppColors.transparent,vertiCalPadding: 10.h,fontClr: AppColors.black,color: AppColors.transparent,text: companyList.companyList[index].companyName, callback: () {
              companyList.selectedCompanyName = companyList.companyList[index].companyName;
              companyList.selectedCompanyId = companyList.companyList[index].id;
              Get.back();
            },),
            const Divider(),
          ],
        );
      },);
    },);
  }
}
