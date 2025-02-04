import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/common/shimmer_effect.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/list_shimmer_effect.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/features/company/presentation/widget/title_with_value.dart';
import 'package:vir/features/gst_tax/presenation/store/gst_store.dart';
import 'package:vir/injection.dart';

class GstList extends StatefulWidget {
  const GstList({super.key});

  @override
  State<GstList> createState() => _GstListState();
}

class _GstListState extends State<GstList> {
  final gstList = getIt<GstStore>();

  @override
  void initState() {
    gstList.fetchGstList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.gst,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {

              Get.toNamed(RoutesNames.gstDetails,);

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => gstList.fetchGstList(),
              child: Observer(
                  builder: (context) {
                    if(gstList.isLoading){
                      return const ListShimmerEffect();
                    }
                    else{
                      return  gstList.gstList.isEmpty
                          ? const EmptyWidget(title: "Gst")
                          : ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        itemCount: gstList.gstList.length,
                        itemBuilder: (context, index) {
                          final gst = gstList.gstList[index];
                          return CustomCard(
                              spreadRadius: 0,
                              blurRadius: 0,
                              child: Column(
                                spacing: 4.h,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      TitleWithValue(
                                        title: "Id",
                                        value: '${gst.id}',
                                      ),

                                      TitleWithValue(
                                        title: "Effective date",
                                        value: Operation.dateFormateForUi(gst.effectiveDate),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TitleWithValue(
                                        title: "Cgst",
                                        value: '${gst.cGstValue} . ',
                                      ),

                                      TitleWithValue(
                                        title: "Sgst",
                                        value: gst.sGstValue,
                                      ),
                                    ],
                                  ),

                                ],
                              ).paddingSymmetric(
                                  vertical: 14.h, horizontal: 10.w))
                              .paddingOnly(bottom: 6.h);
                        },
                      );
                    }
                  }
              ),
            ),
          )
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}
