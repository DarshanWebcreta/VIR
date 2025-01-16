
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/svg_widget.dart';

import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/core/utils/font_size.dart';
import 'package:vir/features/dashboard/presentation/dashboard_screen.dart';
import 'package:vir/features/main_screen/store/main_screen_store.dart';
import 'package:vir/features/master/presentation/master_page.dart';
import 'package:vir/features/profile/presentation/profile_screen.dart';
import 'package:vir/features/quote/presentation/quote_list.dart';
import 'package:vir/injection.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final mainScreenTab.indexTab = Mains
  final MainScreenTab mainScreenTab = getIt<MainScreenTab>();
  @override
  Widget build(BuildContext context) {

    List<Widget> tabItems = [
      const DashboardScreen(),
      const Quatation(),
      const MasterPage(),
      const ProfileScreen(),
    ];


    return Scaffold(

      body:Observer(
        builder: (_) {
          return tabItems[mainScreenTab.index];
        },
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.zero,
          height:Platform.isIOS?85.h:67.h,
          //  height:ResponsiveDesign.isMobile(context)? 80.h:110.h,
          width: 1.sw,
          decoration:  BoxDecoration(
              borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r)),
              color: AppColors.themeColor,
              gradient:AppColors.gradiant()

          ),
          child: Padding(
            padding: EdgeInsets.only(left: Get.context!.height<650?24.w:35.w),
            child: Center(
              child: ListView.builder(

                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Observer(builder: (context) {
                      return InkWell(
                        onTap: () {
                          mainScreenTab.changeTab(index);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Container(
                              decoration: BoxDecoration(color:  mainScreenTab.index==index? AppColors.white:AppColors.transparent,borderRadius: BorderRadius.circular(8.r)),
                              child: SvgWidget(width: 22, height: 22, path: AppStrings.tabImages[index],colorFilter:  ColorFilter.mode(mainScreenTab.index==index?AppColors.themeColor:AppColors.white, BlendMode.srcIn),).paddingAll(6.w),
                            ),
                            TextWidget(text: AppStrings.title[index],fontWeight:FontWeight.normal,fontSize: FontSizes.mini,clr: AppColors.white ,).paddingOnly(top: 4.h)
                          ],
                        ),
                      );
                    },)
                  );
                },
              ),
            ),
          )) ,
    );
  }
}

