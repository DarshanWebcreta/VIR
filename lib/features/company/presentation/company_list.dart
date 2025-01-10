import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/common/shimmer_effect.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/company/presentation/widget/title_with_value.dart';
import 'package:vir/injection.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final companyList = getIt<CompanyStore>();

  @override
  void initState() {
    companyList.callApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.companies,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {

              Get.toNamed(RoutesNames.companyDetails,);

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => companyList.callApi(),
              child: Observer(
                builder: (context) {
                  if(companyList.isLoading){
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      itemCount: 10,itemBuilder: (context, index) {
                      return CustomSizeBox(height: 102.h, width: 0,child: const ShimmerCard(radius: 8,),).paddingOnly(top: 6.h);
                    },);
                  }
                  else{
                    return  companyList.companyList.isEmpty
                        ? const EmptyWidget(title: "No Company found")
                        : ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      itemCount: companyList.companyList.length,
                      itemBuilder: (context, index) {
                        final company = companyList.companyList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesNames.companyDetails,arguments: companyList.companyList[index]);
                          },
                          child: CustomCard(
                              spreadRadius: 0,
                              blurRadius: 0,
                              child: Column(
                                spacing: 4.h,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: company.companyName,
                                        fontSize: FontSizes.mediuam,
                                        fontWeight: FontWeights.large,
                                      ),
                                      IconWidget(
                                        icon: Icons.delete_outline,
                                        onPress: () {
                                          companyList.deleteCompany(companyList.companyList[index].id);
                                        },
                                        size: 18,
                                        clr: AppColors.red,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TitleWithValue(
                                        title: "Reg",
                                        value: '${company.registrationNo} . ',
                                      ),
                                      TitleWithValue(
                                        title: company.providentFundNo,
                                        value: '999886',
                                      ),
                                    ],
                                  ),
                                  TitleWithValue(
                                    title: "Ser. Tax No",
                                    value: company.serviceTaxNo,
                                  ),
                                  Row(
                                    children: [
                                      TitleWithValue(
                                        title: "GST",
                                        value: '${company.gstNo} . ',
                                      ),
                                      TitleWithValue(
                                        title: "PT No",
                                        value: company.profTaxNo,
                                      ),
                                    ],
                                  ),
                                ],
                              ).paddingSymmetric(
                                  vertical: 14.h, horizontal: 10.w))
                              .paddingOnly(bottom: 6.h),
                        );
                      },
                    );
                  }
                }
              ),
            ),
          )
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}
