
import 'package:get/get.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/features/add_quote/presentation/add_new_quote.dart';

import 'package:vir/features/auth/presentation/forget_password/forget_password.dart';
import 'package:vir/features/auth/presentation/login/login_screen.dart';
import 'package:vir/features/bonus/bonus_list.dart';
import 'package:vir/features/bonus/bonus_view.dart';
import 'package:vir/features/category/category_list.dart';
import 'package:vir/features/category/category_view.dart';
import 'package:vir/features/company/presentation/company_details.dart';
import 'package:vir/features/company/presentation/company_list.dart';
import 'package:vir/features/esic/esic_list.dart';
import 'package:vir/features/esic/esic_view.dart';
import 'package:vir/features/leave/leave_list.dart';
import 'package:vir/features/leave/leave_view.dart';


import 'package:vir/features/main_screen/main_screen.dart';
import 'package:vir/features/provident_fund/presentation/provident_fund_list.dart';
import 'package:vir/features/provident_fund/presentation/provident_fund_view.dart';
import 'package:vir/features/splash/presentation/splash_screen.dart';
import 'package:vir/features/subject/presentation/subject_list.dart';
import 'package:vir/features/subject/presentation/subject_view.dart';

import 'package:vir/features/t&c/presentation/t&c_list.dart';
import 'package:vir/features/t&c/presentation/t&c_view.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: RoutesNames.splash,
      page: () => const SplashScreen(),
    ),

 GetPage(
      name: RoutesNames.login,
      page: () => const LoginScreen(),
    ),
 GetPage(
      name: RoutesNames.forgetPassword,
      page: () => const ForgetPassword(),
    ),

    GetPage(
      name: RoutesNames.mainPage,
      page: () => const MainScreen(),
    ),
   GetPage(
      name: RoutesNames.addNewQuote,
      page: () => const AddNewQuote(),
    ),

    GetPage(
      name: RoutesNames.companyList,
      page: () => const CompanyList(),
    ), GetPage(
      name: RoutesNames.companyDetails,
      page: () =>  CompanyDetails(companyData: Get.arguments,),
    ), GetPage(
      name: RoutesNames.providentfundList,
      page: () => const ProvidentFundList(),
    ),

    GetPage(
      name: RoutesNames.providentFundView,
      page: () => const ProvidentFundView(),
    ),

    GetPage(
      name: RoutesNames.categoryList,
      page: () => const CategoryList(),
    ),
    GetPage(
      name: RoutesNames.catgoryView,
      page: () =>  CategoryView(categoryData: Get.arguments,),
    ),

    GetPage(
      name: RoutesNames.subjectList,
      page: () =>  const SubjectList(),
    ),
    GetPage(
      name: RoutesNames.subjectView,
      page: () =>  SubjectView(subjectData: Get.arguments,),
    ),

    GetPage(
      name: RoutesNames.leaveList,
      page: () => const LeaveList(),
    ),
    GetPage(
      name: RoutesNames.leaveView,
      page: () => const LeaveView(),
    ),


    GetPage(
      name: RoutesNames.tcList,
      page: () => const TcList(),
    ),
    GetPage(
      name: RoutesNames.tcView,
      page: () =>  TcView(masterData: Get.arguments,),
    ),

    GetPage(
      name: RoutesNames.bonusList,
      page: () => const BonusList(),
    ),
    GetPage(
      name: RoutesNames.bonusView,
      page: () => const BonusView(),
    ),

    GetPage(
      name: RoutesNames.esicList,
      page: () => const EsicList(),
    ),
    GetPage(
      name: RoutesNames.esicView,
      page: () => const EsicView(),
    ),

  ];
}
