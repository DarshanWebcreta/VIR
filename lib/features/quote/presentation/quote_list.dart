import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/common/shimmer_effect.dart';

import 'package:vir/core/component/card_widget.dart';
import 'package:vir/core/component/circle_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/custom_button.dart';
import 'package:vir/core/component/divider_widget.dart';
import 'package:vir/core/component/icon_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/core/utils/font_weight.dart';
import 'package:vir/core/utils/function_component.dart';

import 'package:vir/core/utils/operation_file.dart';
import 'package:vir/features/main_screen/store/main_screen_store.dart';
import 'package:vir/features/quote/presentation/store/quote_list/quote_store.dart';
import 'package:vir/injection.dart';

class Quatation extends StatefulWidget {
  const Quatation({super.key});

  @override
  State<Quatation> createState() => _QuatationState();
}

class _QuatationState extends State<Quatation> {
  final quoteStore = getIt<QuoteStore>();
  final MainScreenTab mainScreenTab = getIt<MainScreenTab>();

  @override
  void initState() {
    quoteStore.fetchQuotes();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Quote List",home: true,),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => mainScreenTab.changeTab(0),
        child: Column(
          children: [
            CustomButton(text: "+ Add New Quote", callback: () {
              Get.toNamed(RoutesNames.addNewQuote,);
            },vertiCalPadding: FixSizes.paddingVertical,color: AppColors.themeColor,radius: 6,).paddingSymmetric(vertical: 20.h),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () => quoteStore.fetchQuotes(),
                child: Observer(builder: (context) {
                  if(quoteStore.isLoading){
                    return ListView.builder(itemCount: 10,shrinkWrap: true,itemBuilder: (context, index) {
                      return const CustomSizeBox(height: 115, width: 0,child: ShimmerCard(radius: 8,),).paddingOnly(bottom: 8.h);
                    },);
                  }
                  else{
                    return quoteStore.quotes.isEmpty?const EmptyWidget(title: "Quote"):ListView.builder(padding: EdgeInsets.zero,itemCount: quoteStore.quotes.length,itemBuilder: (context, index) {
                      final quoteData = quoteStore.quotes[index];
                      return GestureDetector(
                        onTap: () {

                          Get.toNamed(RoutesNames.addNewQuote,arguments: quoteData.id);

                        },
                        child: CardWidget(radius: 8,horiZontalPadding: 0,verticalPadding: 0,child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Row(

                                   children: [
                                     Expanded(child: TextWidget(text: '${quoteData.id} . ${quoteData.name}',fontSize: FontSizes.mediuam,fontWeight: FontWeights.large,)),
                                     IconWidget(icon: Icons.delete,onPress: () {
                                       FunctionalWidget.askUserDialog( cancel: () {
                                         Get.back();
                                       }, yes: () {
                                         quoteStore.deleteQuote(quoteData.id);
                                       }, title: "Are you sure you want to delete quote?", des: 'This action cannot be undone.');
                                     },clr: AppColors.red,)
                                   ],
                                 ),
                                 TextWidget(text: 'Security Service :  ${quoteData.phoneNo}',fontSize: FontSizes.small,clr: AppColors.grey,fontWeight: FontWeights.small,).paddingOnly(top: 8.h,bottom: 4.h),
                                 TextWidget(text: quoteData.email??'No Email Added',fontSize: FontSizes.small,clr: AppColors.grey,fontWeight: FontWeights.small,),
                              ],
                            ).paddingSymmetric(vertical:12.h,horizontal: 10.w),
                            const DividerWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButtonWidget(onPress: () {
                                  quoteStore.sendMail(quoteData.id);
                                },btnTxt: "Send Email",),
                                const VerticalDeviderWidget().paddingSymmetric(horizontal: 6.w),
                                TextButtonWidget(onPress: () {
                                  Operation.redirectToBrowser(quoteData.quotePdfUrl);

                                },btnTxt: "Quotation PDF",),
                                const VerticalDeviderWidget().paddingSymmetric(horizontal: 6.w),

                                TextButtonWidget(onPress: () {
                                  Operation.redirectToBrowser(quoteData.salaryPdfUrl);
                                },btnTxt: "Salary PDF",),
                              ],
                            ).paddingSymmetric(horizontal: 16.w),
                          ],
                        ),).paddingOnly(bottom: 8.h),
                      );
                    },);
                  }
                },),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: FixSizes.paddingAllAndHorizontol),
      ),
    );
  }
}

class VerticalDeviderWidget extends StatelessWidget {
  const VerticalDeviderWidget({
    super.key,
    this.width = 1,
    this.height = 12,
  });
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(width: width.w,height: height.h,color: AppColors.black,);
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
   required this.onPress,
    required this.btnTxt,
     this.txtClr = AppColors.themeColor,
  });
  final VoidCallback onPress;
  final String btnTxt;
  final Color  txtClr;
  @override
  Widget build(BuildContext context) {
    return TextButton(style: TextButton.styleFrom(padding: EdgeInsets.all(1.w),),onPressed:onPress, child:
    TextWidget(text:btnTxt,fontSize: FontSizes.small,clr: txtClr, ));
  }
}
