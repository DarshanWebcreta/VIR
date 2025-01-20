
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
import 'package:vir/features/esic/presentation/store/esic_store.dart';

import 'package:vir/features/master/presentation/widget/title_value_with_date.dart';
import 'package:vir/injection.dart';

class EsicList extends StatefulWidget {
  const EsicList({super.key});

  @override
  State<EsicList> createState() => _EsicListState();
}

class _EsicListState extends State<EsicList> {
  final esicStore = getIt<EsicStore>();

  @override
  void initState() {
    esicStore.fetchEsicList();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.esicList,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {
              Get.toNamed(RoutesNames.esicView);

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => esicStore.fetchEsicList() ,
              child: Observer(builder: (context) {
                if(esicStore.isLoading){
                  return const ListShimmerEffect();

                }
                else{
                 return esicStore.esicList.isEmpty
                     ? const EmptyWidget(title: "Esic")
                     :ListView.builder(
                   padding: EdgeInsets.symmetric(vertical: 16.h),
                   itemCount: esicStore.esicList.length,
                   itemBuilder: (context, index) {
                     final esic = esicStore.esicList[index];
                     return TitleValueWithDate(value: esic.esicPolicyValue,date: esic.effectiveDate,id: esic.id.toString(),);
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




