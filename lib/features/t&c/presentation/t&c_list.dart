
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
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/master/presentation/widget/status_card.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';
import 'package:vir/injection.dart';


class TcList extends StatefulWidget {
  const TcList({super.key});

  @override
  State<TcList> createState() => _TcListState();
}

class _TcListState extends State<TcList> {
  final termsStore = getIt<TermsStore>();

  @override
  void initState() {
    termsStore.fetchTermList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.tcListTitle,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            value: "Terms & Condition",
            onPress: () {
              Get.toNamed(RoutesNames.tcView, );

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => termsStore.fetchTermList(),
              child: Observer(builder: (context) {
                if(termsStore.isLoading){
                  return const ListShimmerEffect();

                }
                else{
                  return  termsStore.termsList.isEmpty
                      ? const EmptyWidget(title: "Terms & Condition")
                      :ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemCount: termsStore.termsList.length,
                    itemBuilder: (context, index) {
                      final termData = termsStore.termsList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesNames.tcView,arguments:termData );
                        },
                        child:
                        StatusCard(id: termData.id.toString(),deletePress: () {
                          FunctionalWidget.askUserDialog( cancel: () {
                            Get.back();
                          }, yes: () {
                            termsStore.deleteTerm(termData.id);
                          }, title: "Are you sure you want to delete this?", des: 'This action cannot be undone.');
                        },status: termData.status,title:termData.title,sort: termData.sortOrder.toString(),).paddingOnly(bottom: 6.h)
                        ,
                      );
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






