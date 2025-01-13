
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';
import 'package:vir/features/provident_fund/presentation/store/pf_store.dart';
import 'package:vir/injection.dart';

class ProvidentFundList extends StatefulWidget {
  const ProvidentFundList({super.key});

  @override
  State<ProvidentFundList> createState() => _ProvidentFundListState();
}

class _ProvidentFundListState extends State<ProvidentFundList> {
  final pfStore = getIt<PfStore>();

  @override
  void initState() {
    pfStore.fetchPfList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.providentFundListTitle,
        backBtn: true,
      ),
      body: RefreshIndicator(
        onRefresh: () =>pfStore.fetchPfList() ,
        child: Observer(builder: (context) {
          return Column(
            children: [
              AddNewButton(
                onPress: () {
                  Get.toNamed(RoutesNames.providentFundView);

                },
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  itemCount: pfStore.pfList.length,
                  itemBuilder: (context, index) {
                    final pf = pfStore.pfList[index];
                    return TitleValueWithDate(value: pf.pfValue,id: pf.id.toString(),date:pf.effectiveDate ,);
                  },
                ),
              )
            ],
          );
        },).paddingAll(FixSizes.paddingAllAndHorizontol),
      ),
    );
  }
}




