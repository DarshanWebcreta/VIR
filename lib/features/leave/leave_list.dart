
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({super.key});

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.leaveList,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {},
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemCount: 16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesNames.leaveView);
                  },
                  child: const TitleValueWithDate()
                  ,
                );
              },
            ),
          )
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}




