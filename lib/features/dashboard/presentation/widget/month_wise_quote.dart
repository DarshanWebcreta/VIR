import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vir/core/component/compnay_list_sheet.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/empty_sheet_action.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/dashboard/presentation/store/dashboard_store.dart';
import 'package:vir/features/status/presentation/select_status_design.dart';
import 'package:vir/features/status/presentation/store/status_store.dart';
import 'package:vir/injection.dart';

class MonthWiseQuote extends StatelessWidget {
  final dashboardStore = getIt<DashboardStore>();
  final statusStore = getIt<StatusStore>();
  final company = getIt<CompanyStore>();

  MonthWiseQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                FunctionalWidget.customDivider(
                  height: 2,
                  width: FixSizes.fullWidth,
                  clr: AppColors.lightGrey,
                ),
                CustomSizeBox(height: FixSizes.regularHeightWidth, width: 0),
                FunctionalWidget.dropDownButton(
                  label: 'Start date*',
                  title: Operation.titleSet(
                    date: dashboardStore.startDate,
                    defaultValue: "Month Start Date",
                  ),
                  onTap: () async {
                    DateTime? time = await Operation.getDate(startDate: '');
                    if (time != null) {
                      dashboardStore.startDate =
                          DateFormat('yyyy-MM-dd').format(time);
                    }
                  },
                ),
                FunctionalWidget.dropDownButton(
                  label: 'End Date*',
                  title: Operation.titleSet(
                    date: dashboardStore.endDate,
                    defaultValue: "Month End Date",
                  ),
                  onTap: () async {
                    DateTime? time =
                    await Operation.getDate(startDate: dashboardStore.startDate);
                    if (time != null) {
                      dashboardStore.endDate =
                          DateFormat('yyyy-MM-dd').format(time);
                    }
                  },
                ).paddingSymmetric(vertical: 10.h),
                FunctionalWidget.dropDownButton(
                  label:'Company Form*',
                  title:  company.selectedCompanyName.isEmpty?'Select Company Name':company.selectedCompanyName,
                  onTap: () {

                    FunctionalWidget.bottomSheet(height: 500, child:  company.companyList.isEmpty? EmptySheetAction(callback: () {
                      Get.back();
                      Get.toNamed(RoutesNames.companyDetails);
                    },btnTxt: 'company',):const CompanyLists(), title: AppStrings.companyTitle);

                  },
                ),
                Observer(
                  builder: (context) {
                    return FunctionalWidget.dropDownButton(
                      label: 'Status*',
                      title: statusStore.status.isEmpty
                          ? 'Select Status'
                          : statusStore.status.capitalizeFirst!,
                      onTap: () {
                        FunctionalWidget.bottomSheet(
                          height: 220,
                          child: SelectStatusDesign(),
                          title: "Select Status",
                        );
                      },
                    ).paddingSymmetric(vertical: 10.h);
                  },
                ),
              ],
            ),
            CustomSizeBox(
              height: 52,
              width: 0,
              child: CustomButton(
                text: "Get Quote",
                callback: () {
                  //{
                  //     "company_id": 2,
                  //     "status": "approval",
                  //     "start_date": "2025-01-01",
                  //     "end_date": "2025-01-15"
                  // }
                  Get.back();
                  dashboardStore.monthWiseQuoteDownload({'company_id':company.selectedCompanyId,'status':statusStore.status,'start_date':dashboardStore.startDate,
                  'end_date':dashboardStore.endDate});
                  // Action on button click
                },
              ),
            )
          ],
        );
      },
    );
  }


}

