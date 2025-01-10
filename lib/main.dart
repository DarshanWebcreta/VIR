import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vir/core/routes/pages.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/theme/app_colors.dart';
import 'package:vir/injection.dart';

void main() async{
  await GetStorage.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      builder: (context, child) {
        return GlobalLoaderOverlay(
          disableBackButton: false,

          overlayWidgetBuilder: (progress) {
            return  const Center(
              child:CircularProgressIndicator() ,
            );
          },
          child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: GetMaterialApp(
                defaultTransition: Get.defaultTransition,
                transitionDuration: const Duration(milliseconds: 250),
                debugShowCheckedModeBanner: false,
                initialRoute: RoutesNames.splash,
                getPages: AppPages.pages,
                theme: ThemeData(
                    scaffoldBackgroundColor: AppColors.bgColor,

                    cardTheme: const CardTheme(color:AppColors.white,elevation: 0 )
                ),
              )),
        );
      },
    );
  }
}
