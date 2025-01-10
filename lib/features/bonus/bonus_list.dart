
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';

class BonusList extends StatefulWidget {
  const BonusList({super.key});

  @override
  State<BonusList> createState() => _BonusListState();
}

class _BonusListState extends State<BonusList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.bonusList,
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
                    Get.toNamed(RoutesNames.bonusView);
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




