
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/bonus/presentation/store/bonus_store.dart';
import 'package:vir/features/leave/presentation/store/leave_store.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';
import 'package:vir/injection.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({super.key});

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  final leaveStore = getIt<LeavesStore>();
  final leave = TextEditingController();
  @override
  void initState() {
    leaveStore.fetchLeavesList();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    leave.dispose();
    // TODO: implement dispose
    super.dispose();
  }
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
            onPress: () {
              Get.toNamed(RoutesNames.leaveView);

            },
          ),
          Observer(builder: (context) {
            return  Expanded(
              child: RefreshIndicator(
                onRefresh: () => leaveStore.fetchLeavesList(),

                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  itemCount: leaveStore.leaveList.length,
                  itemBuilder: (context, index) {
                    final leaveData = leaveStore.leaveList[index];
                    return TitleValueWithDate(value: leaveData.leaveValue, id: leaveData.id.toString(), date: leaveData.effectiveDate,);
                  },
                ),
              ),
            );
          },)
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}




