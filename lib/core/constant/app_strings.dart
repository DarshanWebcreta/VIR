

import 'package:vir/core/key/image_keys.dart';

class AppStrings{
  AppStrings._();
  static const homepageTitle = 'title';
  static const success = "success";
  static const String currencySymbol = '₹';
  static const String rightSymbol = '✓';
  static const int toasterTime = 3000;
  static const String loginSheetTitle = 'Login to Vir Security';
  static const String forgetPassword = 'Forget password?';
  static const String loginSheetDesciption = 'Warehouse management dashboard';
  static const String submit = "Submit";
  static const String assignPickList = "Assigned Pick List";
  static const String monthWiseQuote = "Month wise Qoute";
  static const String companyTitle = "Select Company";

  static const String noteForcustomerDetails = "Invoice & Delivery Address are the same";
  static const String registerEmailAddress = "Registered Email Address";
  static const String forgetPasswordDescription = "Please enter your email address to receive a verification code.";


  static const List<String> title = [
    "Home",
    "Quotes",
    "Masters",
    "Profile",
  ];

  static const List<String> productListStatus = [
    "all",
    "active",
    "draft",
    "archive",
  ];

  static const List<String> status = [
    "hold",
    "pending",
    "approval",
  ];

  static const List<String> tabImages = [
    ImageStrings.home,
    ImageStrings.quote,
    ImageStrings.masters,
    ImageStrings.profile,
  ];

  static const List<String> orderListStatus = [
    "all",
    "fulfilled",
    "unfulfilled",
  ];

  static const List<String> pickListStatus = [
    "all",
    "assigned_me",
    "open",
    "picked",
    "partial_picked",
    "closed",
  ];

  static const List<String> ascDscFilter = [
    "asc_by_name",
    "asc_by_stock",
    "desc_by_name",
    "desc_by_stock",
  ];

  static const List<String> latestOlder = [
    "latest",
    "older",
  ];
  static const List<int> brandFilter = [
   0,1,2,3,4,5,6,7
  ];

  static const String productTitle = "Products";
  static const String providentFundListTitle = "Provident Fund List";
  static const String categoryListTitle = "Category List";
  static const String categoryViewTitle = "Category View";
  static const String providentFundViewTitle = "Provident Fund View";
  static const String stockHistoryPageTitle = "Stock History";
  static const String picklistTitle = "Pick List";
  static const String subjectListTitle = "Subject List";
  static const String subjectViewTitle = "Subject View";
  static const String orderListTitle = "Orders List";
  static const String companies = "Companies";
  static const String companyDetails = "Company Details";
  static const String tcListTitle = "Terms & Conditions List";
  static const String tcViewTitle = "Terms & Condition View";
  static const String esicList = "ESIC Policies";
  static const String esicView = "ESIC policy";

  static const String bonusList = "Bonus List";
  static const String bonusView = "Bonus View";

  static const String leaveList = "Leave List";
  static const String leaveView = "Leave View";



  static const String emptyProductDes = "No products available at the moment , Please try after sometime.";
  static const String emptyProductTitle = "No categories found!";

}