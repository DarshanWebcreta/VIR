



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:retrofit/retrofit.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/secrets/api_end_point.dart';
import 'package:vir/core/secrets/api_strings.dart';
import 'package:vir/data/interceptor.dart';
import 'package:vir/features/auth/data/model/login_model.dart';
import 'package:vir/features/category/data/model/category_model.dart';
import 'package:vir/features/company/data/model/company_model.dart';
import 'package:vir/features/dashboard/data/model/dashboard_count_model.dart';
import 'package:vir/features/profile/data/model/profile_model.dart';
import 'package:vir/features/quote/data/model/quote_model.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';




part 'api_service.g.dart';

@RestApi(baseUrl: ApiStrings.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) {
    final interceptor = DefaultInterceptor();
    dio.interceptors.add(interceptor);
    dio.interceptors.add(PrettyDioLogger(requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return _ApiService(dio);
  }


  @GET('posts')
  Future<List<String>> getTasks();

  @GET(ApiPath.dashboardCount)
  Future<DashboardModel> dashboardCount();
  @POST(ApiPath.login)
  Future<LoginModel> login(@Body() String body);

  @POST(ApiPath.monthWiseQuoteDownbload)
  Future<CommonModel> monthWiseQuoteDownload(@Body() dynamic body);

  @POST(ApiPath.forgetPassword)
  Future<CommonModel> forgetPassword(@Body() String body);

  @GET(ApiPath.companyList)
  Future<CompanyModel> companyList();


  @GET(ApiPath.categoriesList)
  Future<MasterModel> categoryList();

  @PUT("${ApiPath.categoriesList}/{id}")
  Future<CommonModel> updateCategory(@Path("id") int id, @Body() dynamic request);

  @POST(ApiPath.categoriesList)
  Future<CommonModel> addCategory( @Body() dynamic request);

  @DELETE("${ApiPath.categoriesList}/{id}")
  Future<CommonModel> deleteCategory(@Path("id") int id);


  @GET(ApiPath.subjectList)
  Future<MasterModel> subjectList();

  @PUT("${ApiPath.subjectList}/{id}")
  Future<CommonModel> updatesubject(@Path("id") int id, @Body() dynamic request);

  @POST(ApiPath.subjectList)
  Future<CommonModel> addSubject( @Body() dynamic request);

  @DELETE("${ApiPath.subjectList}/{id}")
  Future<CommonModel> deleteSubject(@Path("id") int id);




  @DELETE("${ApiPath.companyList}/{id}")
  Future<CommonModel> deleteCompanyDetail(@Path("id") int id);

  @POST("${ApiPath.addCompany}/{id}?_method=PUT")
  @MultiPart()
  Future<CommonModel> updateCompanyDetails(
      @Path("id") int id,
      @Part(name: "company_name") String companyName,
      @Part(name: "registration_no") String registrationNo,
      @Part(name: "provident_fund_no") String providentFundNo,
      @Part(name: "service_tax_no") String serviceTaxNo,
      @Part(name: "gst_no") String gstNo,
      @Part(name: "prof_tax_no") String profTaxNo,
      @Part(name: "pan_no") String panNo,
      @Part(name: "gujarat_police_no") String gujaratPoliceNo,
      @Part(name: "rajasthan_police_no") String rajasthanPoliceNo,
      @Part(name: "company_logo") File? file,
      );

  @POST(ApiPath.addCompany)
  @MultiPart()
  Future<CommonModel> addCompany(
      @Part(name:'company_name') String companyName,
      @Part(name:'provident_fund_no') String pfNo,
      @Part(name:'registration_no') String regNo,
      @Part(name:'service_tax_no') String serTax,
      @Part(name:'gst_no') String gstNo,
      @Part(name:'prof_tax_no') String profTax,
      @Part(name:'pan_no') String panNo,
      @Part(name:'gujarat_police_no') String gujPoliceNo,
      @Part(name:'rajasthan_police_no') String rjPoliceNo,
      @Part(name: "company_logo") File? file,
     );




  @GET(ApiPath.terms)
  Future<MasterModel> termList();

  @PUT("${ApiPath.terms}/{id}")
  Future<CommonModel> updateTerm(@Path("id") int id, @Body() dynamic request);

  @POST(ApiPath.terms)
  Future<CommonModel> addTerm( @Body() dynamic request);

  @DELETE("${ApiPath.terms}/{id}")
  Future<CommonModel> deleteTerm(@Path("id") int id);


  @GET(ApiPath.pf)
  Future<MasterModel> pfList();

  @POST(ApiPath.pf)
  Future<CommonModel> addPf( @Body() dynamic request);

  @GET(ApiPath.esic)
  Future<MasterModel> esicList();
  @POST(ApiPath.esic)
  Future<CommonModel> addEsic( @Body() dynamic request);

  @GET(ApiPath.leaves)
  Future<MasterModel> leavesList();

  @POST(ApiPath.leaves)
  Future<CommonModel> addLeaves( @Body() dynamic request);

  @GET(ApiPath.bonus)
  Future<MasterModel> bonusList();

  @POST(ApiPath.bonus)
  Future<CommonModel> addBonus( @Body() dynamic request);

  @GET(ApiPath.profile)
  Future<ProfileModel> profile();

  @POST("${ApiPath.profile}/update")
  Future<CommonModel> updateProfile( @Body() dynamic request);

  @POST(ApiPath.changePass)
  Future<CommonModel> changePass( @Body() dynamic request);


  @GET(ApiPath.gst)
  Future<MasterModel> gstList();

  @POST(ApiPath.gst)
  Future<CommonModel> addGst( @Body() dynamic request);

  @GET(ApiPath.quote)
  Future<QuoteModel> quoteList();

  @POST(ApiPath.quote)
  Future<CommonModel> addQuote( @Body() dynamic request);

  @PUT("${ApiPath.quote}/{id}")
  Future<CommonModel> updateQuote(@Path("id") int id, @Body() dynamic request);

  @DELETE("${ApiPath.quote}/{id}")
  Future<CommonModel> deleteQuote(@Path("id") int id);

  @GET("${ApiPath.quote}/${ApiPath.sendMail}/{id}")
  Future<CommonModel> sendMail(@Path("id") int id);

  @GET("${ApiPath.quote}/{id}/edit")
  Future<QuoteViewModel> viewQuote(@Path("id") int id);
}





