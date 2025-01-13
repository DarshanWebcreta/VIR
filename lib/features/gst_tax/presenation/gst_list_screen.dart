import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/common/shimmer_effect.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_card.dart';
import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
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
        title: AppStrings.companies,
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
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        itemCount: 10,itemBuilder: (context, index) {
                        return CustomSizeBox(height: 102.h, width: 0,child: const ShimmerCard(radius: 8,),).paddingOnly(top: 6.h);
                      },);
                    }
                    else{
                      return  gstList.gstList.isEmpty
                          ? const EmptyWidget(title: "No Company found")
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
                                        value: '${gst.id} . ',
                                      ),

                                      TitleWithValue(
                                        title: "Effective date",
                                        value: '${gst.effectiveDate} . ',
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
                                        value: '${gst.sGstValue} . ',
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
