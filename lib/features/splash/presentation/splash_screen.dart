import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/component/app_logo.dart';
import 'package:vir/core/key/storage_keys.dart';
import 'package:vir/core/storage/app_storage.dart';
import 'package:vir/core/theme/app_colors.dart';

import '../../../core/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),() {

      Get.offAllNamed(StorageManager.readData(StoreKeys.token)==null?
      RoutesNames.login
          :RoutesNames.mainPage);
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Container(
          color: AppColors.white,
          child:  const Center(
            child: AppLogo(),
          ),
        ),
      ),
    );
  }


}





