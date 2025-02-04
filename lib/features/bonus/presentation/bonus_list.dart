
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/list_shimmer_effect.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/bonus/presentation/store/bonus_store.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';
import 'package:vir/injection.dart';

class BonusList extends StatefulWidget {
  const BonusList({super.key});

  @override
  State<BonusList> createState() => _BonusListState();
}

class _BonusListState extends State<BonusList> {
  final bonusStore = getIt<BonusStore>();
  final bonus = TextEditingController();
  @override
  void initState() {
    bonusStore.fetchBonusList();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    bonus.dispose();
    // TODO: implement dispose
    super.dispose();
  }
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
            value: 'Bonus',
            onPress: () {
              Get.toNamed(RoutesNames.bonusView);

            },
          ),
         Expanded(
           child: RefreshIndicator(
             onRefresh: () => bonusStore.fetchBonusList(),

             child: Observer(builder: (context) {
               if(bonusStore.isLoading){
                 return const ListShimmerEffect();

               }
               else{
                 return  bonusStore.bonusList.isEmpty
                     ? const EmptyWidget(title: "Bonus")
                     :ListView.builder(
                   padding: EdgeInsets.symmetric(vertical: 16.h),
                   itemCount: bonusStore.bonusList.length,
                   itemBuilder: (context, index) {
                     final bonusData = bonusStore.bonusList[index];
                     return TitleValueWithDate(value: bonusData.bonusValue, id: bonusData.id.toString(), date: bonusData.effectiveDate,);
                   },
                 );
               }
             },),
           ),
         )
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}




