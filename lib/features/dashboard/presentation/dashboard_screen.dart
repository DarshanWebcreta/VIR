import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/shimmer_effect.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/app_logo.dart';

import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';

import 'package:vir/core/component/svg_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/key/image_keys.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/category/presentation/store/category_store.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/dashboard/presentation/store/dashboard_store.dart';

import 'package:vir/features/dashboard/presentation/widget/month_wise_quote.dart';
import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';
import 'package:vir/injection.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashBoardStore = getIt<DashboardStore>();

  final companyList = getIt<CompanyStore>();

  @override
  void initState() {
    if(companyList.companyList.isEmpty){
      companyList.callApi();
    }
    dashBoardStore.callApi();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white,leading: const AppLogo().paddingAll(10.w),leadingWidth: 100,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),),
      body: Observer(builder: (context) {
        if(!dashBoardStore.isLoading){
          return RefreshIndicator(
            onRefresh: () => dashBoardStore.callApi(),
            child: ListView(
              children: [
                 HomeCardWidget(
                  svgIcon: ImageStrings.quote,
                  value:dashBoardStore.dashboardModel?.data.quoteCount ,
                  title: "Quotation",
                ),
                // const HomeCardWidget(
                //   svgIcon: ImageStrings.company,
                //   value: 78,
                //   title: "Total Companies",
                // ).paddingSymmetric(vertical: 8.h),
                GestureDetector(
                  onTap: () {
                    FunctionalWidget.bottomSheet(height: 500, child:  MonthWiseQuote(), title: AppStrings.monthWiseQuote);
                  },
                  child: const HomeCardWidget(
                    svgIcon: ImageStrings.reports,

                    title: "Month Wise Quote PDF",
                  ),
                ).paddingOnly(bottom:10.h ,top: 8.h),
                AddNewButton(onPress: () {
                  Get.toNamed(RoutesNames.addNewQuote);
                },).paddingOnly(top: 10.h)
              ],
            ).paddingAll(FixSizes.paddingAllAndHorizontol),
          );

        }
        else{
          return  Column(
            children: [
              const CustomSizeBox(height: 67, width:0,child: ShimmerCard(radius: 8,),),
              const CustomSizeBox(height: 67, width:0,child: ShimmerCard(radius: 8,),).paddingOnly(top: 8.h,bottom: 10.h),
              const CustomSizeBox(height: 67, width:0,child: ShimmerCard(radius: 8,),),


            ],
          );
        }
      },),
    );
  }
}



class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    this.value,
    required this.svgIcon,
  });
  final String svgIcon;
  final int? value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        horiZontalPadding: 20.w,
        verticalPadding: value == null ? 28.h : 14.h,
        child: Row(
          crossAxisAlignment: value == null
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgWidget(
              width: value == null ? 16 : 24,
              height: value == null ? 16 : 24,
              path: svgIcon,
              colorFilter:
                  const ColorFilter.mode(AppColors.themeColor, BlendMode.srcIn),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (value != null)
                  TextWidget(
                    text: '$value',
                    fontSize: FontSizes.extraLarge,
                    fontWeight: FontWeights.large,
                  ).paddingOnly(bottom: 8.h),
                TextWidget(
                  text: title,
                  fontSize: FontSizes.small,
                  fontWeight: FontWeights.small,
                  clr: AppColors.grey,
                ),
              ],
            )
          ],
        ));
  }
}
