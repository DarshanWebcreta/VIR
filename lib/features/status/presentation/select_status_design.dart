import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/features/status/presentation/store/status_store.dart';

import 'package:vir/injection.dart';

class SelectStatusDesign extends StatelessWidget {
  final statusStore = getIt<StatusStore>();
   SelectStatusDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(shrinkWrap: true,itemCount: AppStrings.status.length,itemBuilder: (context, index) {
      return Column(
        children: [
          CustomButton(fontClr: AppColors.black,borderClr: AppColors.transparent,color: AppColors.transparent,text: AppStrings.status[index].capitalizeFirst!,radius: 5,vertiCalPadding: 6.h, callback: () {
            statusStore.status = AppStrings.status[index];

            Get.back();
          },).paddingOnly(bottom: 4.h),
           const Divider()

        ],
      );
        },);
  }
}
