import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vir/data/api_service.dart';
import 'package:vir/features/add_quote/presentation/store/add_new_quote_store.dart';
import 'package:vir/features/auth/data/repositories/auth_impl_repo.dart';
import 'package:vir/features/auth/data/repositories/auth_remote_repo.dart';
import 'package:vir/features/auth/domain/repository/auth_repository.dart';
import 'package:vir/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:vir/features/auth/domain/usecase/login_usecase.dart';
import 'package:vir/features/auth/presentation/forget_password/store/forget_password_store.dart';
import 'package:vir/features/auth/presentation/login/store/login_store.dart';
import 'package:vir/features/bonus/data/repositories/bonus_impl_repo.dart';
import 'package:vir/features/bonus/data/repositories/bonus_remote_repo.dart';
import 'package:vir/features/bonus/domain/repository/bonus_repo.dart';
import 'package:vir/features/bonus/domain/usecase/bonus_add_usecase.dart';
import 'package:vir/features/bonus/domain/usecase/bonus_fetch_usecase.dart';
import 'package:vir/features/bonus/presentation/store/bonus_store.dart';
import 'package:vir/features/category/data/repositories/category_impl_repo.dart';
import 'package:vir/features/category/data/repositories/category_remote_repo.dart';
import 'package:vir/features/category/domain/repository/category_repo.dart';
import 'package:vir/features/category/domain/usecase/category_usecase.dart';
import 'package:vir/features/category/presentation/store/category_store.dart';
import 'package:vir/features/company/data/repositories/company_impl_repo.dart';
import 'package:vir/features/company/data/repositories/company_remote_repo.dart';
import 'package:vir/features/company/domain/repository/company_repo.dart';
import 'package:vir/features/company/domain/usecase/add_company_usecase.dart';
import 'package:vir/features/company/domain/usecase/company_usecase.dart';
import 'package:vir/features/company/domain/usecase/delete_company_usecase.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/dashboard/data/repositories/dahboard_impl_repo.dart';
import 'package:vir/features/dashboard/data/repositories/dashboard_remote_repo.dart';
import 'package:vir/features/dashboard/domain/repository/dashboard_repo.dart';
import 'package:vir/features/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:vir/features/dashboard/domain/usecase/month_wise_quote_gen.dart';
import 'package:vir/features/dashboard/presentation/store/dashboard_store.dart';
import 'package:vir/features/esic/data/repositories/esic_impl_repo.dart';
import 'package:vir/features/esic/data/repositories/esic_remote_repo.dart';
import 'package:vir/features/esic/domain/repository/esic_repo.dart';
import 'package:vir/features/esic/domain/usecase/add_esic_usecase.dart';
import 'package:vir/features/esic/domain/usecase/get_esic_usecase.dart';
import 'package:vir/features/esic/presentation/store/esic_store.dart';
import 'package:vir/features/gst_tax/data/repositories/gst_impl_repo.dart';
import 'package:vir/features/gst_tax/data/repositories/gst_remote_repo.dart';
import 'package:vir/features/gst_tax/domain/repository/gst_repo.dart';
import 'package:vir/features/gst_tax/domain/usecase/gst_add_usecase.dart';
import 'package:vir/features/gst_tax/domain/usecase/gst_list_usecase.dart';
import 'package:vir/features/gst_tax/presenation/store/gst_store.dart';
import 'package:vir/features/leave/data/repositories/leave_impl_repo.dart';
import 'package:vir/features/leave/data/repositories/leave_remote_repo.dart';
import 'package:vir/features/leave/domain/repository/leave_repo.dart';
import 'package:vir/features/leave/domain/usecase/add_leave_usecase.dart';
import 'package:vir/features/leave/domain/usecase/fetch_leave_usecase.dart';
import 'package:vir/features/leave/presentation/store/leave_store.dart';
import 'package:vir/features/main_screen/store/main_screen_store.dart';
import 'package:vir/features/profile/data/repositories/profile_impl_repo.dart';
import 'package:vir/features/profile/data/repositories/profile_remote_repo.dart';
import 'package:vir/features/profile/domain/repository/profile_repository.dart';
import 'package:vir/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:vir/features/profile/domain/usecase/fetch_profile_usecase.dart';
import 'package:vir/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:vir/features/profile/presentation/store/profile_store.dart';
import 'package:vir/features/provident_fund/data/repositories/pf_impl_repo.dart';
import 'package:vir/features/provident_fund/data/repositories/pf_remote_repo.dart';
import 'package:vir/features/provident_fund/domain/repository/pf_repo.dart';
import 'package:vir/features/provident_fund/domain/usecase/pf_usecase.dart';
import 'package:vir/features/provident_fund/presentation/store/pf_store.dart';
import 'package:vir/features/status/presentation/store/status_store.dart';
import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/features/subject/repositories/subject_impl_repo.dart';
import 'package:vir/features/subject/repositories/subject_remote_repo.dart';
import 'package:vir/features/subject/repository/subject_repo.dart';
import 'package:vir/features/subject/usecase/subject_usecase.dart';
import 'package:vir/features/t&c/data/repositories/terms_impl_repo.dart';
import 'package:vir/features/t&c/data/repositories/terms_remote_repo.dart';
import 'package:vir/features/t&c/domain/repository/terms_repo.dart';
import 'package:vir/features/t&c/domain/usecase/terms_usecase.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';

final getIt = GetIt.instance;


void setup() {

/// registerSingleton: Registers a single instance of a class that is immediately available across the app.
/// registerLazySingleton: Registers a single instance of a class that is created only when it's first accessed   .
/// registerFactory: Registers a factory that provides a new instance every time it's requested.

  final ApiService apiServices = ApiService(Dio());
  //for same instance every time
  getIt.registerLazySingleton<MainScreenTab>(()=>MainScreenTab());
  getIt.registerLazySingleton(() => apiServices);



  //diff instace every time
  getIt.registerFactory<AddNewQuoteStore>(() => AddNewQuoteStore());


   getIt.registerLazySingleton<AuthRemoteRepo>(()=>AuthImplRemoteRepo(apiService: getIt()));
   getIt.registerLazySingleton<AuthRepository>(()=>AuthImplRepo(loginRemoteRepo: getIt()));
   getIt.registerLazySingleton<LoginUsecase>(()=>LoginUsecase(authRepository: getIt()));
   getIt.registerLazySingleton<ForgetPasswordUsecase>(()=>ForgetPasswordUsecase(authRepository: getIt()));
   getIt.registerLazySingleton<LoginStore>(() => LoginStore());
   getIt.registerLazySingleton<ForgetPasswordStore>(() => ForgetPasswordStore());

  getIt.registerLazySingleton<DashboardRemoteRepo>(()=>DashboardImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<DashboardRepo>(()=>DashboardImplRepo(dashboardRemoteRepo: getIt()));
  getIt.registerLazySingleton<DashboardUsecase>(()=>DashboardUsecase(dashboardRepo: getIt()));
  getIt.registerLazySingleton<MonthWiseQuoteDownloadUseCase>(()=>MonthWiseQuoteDownloadUseCase(quoteRepo: getIt()));
  getIt.registerLazySingleton<DashboardStore>(()=>DashboardStore());


  getIt.registerLazySingleton<CompanyRemoteRepo>(
          () => CompanyImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<CompanyRepo>(
          () => CompanyImplRepo(companyRemoteRepo: getIt()));
  getIt.registerLazySingleton<CompanyUsecase>(
          () => CompanyUsecase(companyRepo: getIt()));
  getIt.registerLazySingleton<AddCompanyUsecase>(
          () => AddCompanyUsecase(companyRepo: getIt()));

  getIt.registerLazySingleton<DeleteCompanyDetailUseCase>(
          () => DeleteCompanyDetailUseCase(companyRepo: getIt()));
  getIt.registerLazySingleton<CompanyStore>(() => CompanyStore());


  getIt.registerLazySingleton<CategoryRemoteRepo>(() => CategoryImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryImplRepo(categoryRemoteRepo: getIt()));
  getIt.registerLazySingleton<CategoryListUsecase>(() => CategoryListUsecase(categoryRepo: getIt()));
  getIt.registerLazySingleton<UpdateCategoryUsecase>(() => UpdateCategoryUsecase(categoryRepo: getIt()));
  getIt.registerLazySingleton<DeleteCategoryUsecase>(() => DeleteCategoryUsecase(categoryRepo: getIt()));
  getIt.registerLazySingleton<AddCategoryUsecase>(() => AddCategoryUsecase(categoryRepo: getIt()));

  getIt.registerLazySingleton<CategoryStore>(() => CategoryStore());


  getIt.registerLazySingleton<SubjectRemoteRepo>(() => SubjectImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<SubjectRepo>(() => SubjectImplRepo(subjectRemoteRepo: getIt()));
  getIt.registerLazySingleton<SubjectListUsecase>(() => SubjectListUsecase(subjectRepo: getIt()));
  getIt.registerLazySingleton<AddSubjectUsecase>(() =>  AddSubjectUsecase(subjectRepo: getIt()));
  getIt.registerLazySingleton<DeleteSubjectUsecase>(() => DeleteSubjectUsecase(subjectRepo: getIt()));
  getIt.registerLazySingleton<UpdateSubjectUsecase>(() => UpdateSubjectUsecase(subjectRepo: getIt()));
  getIt.registerLazySingleton<SubjectStore>(() => SubjectStore());

  getIt.registerLazySingleton<TermsRemoteRepo>(() => TermsImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<TermsRepo>(() => TermsImplRepo(termsRemoteRepo: getIt()));
  getIt.registerLazySingleton<TermListUsecase>(() => TermListUsecase(termsRepo: getIt()));
  getIt.registerLazySingleton<AddTermUsecase>(() => AddTermUsecase(termsRepo: getIt()));
  getIt.registerLazySingleton<DeleteTermUsecase>(() => DeleteTermUsecase(termsRepo: getIt()));
  getIt.registerLazySingleton<UpdateTermUsecase>(() => UpdateTermUsecase(termsRepo: getIt()));
  getIt.registerLazySingleton<TermsStore>(() => TermsStore());


  getIt.registerLazySingleton<PfRemoteRepo>(() =>PfImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<PfRepo>(() =>PfImplRepo(pfRemoteRepo: getIt()));
  getIt.registerLazySingleton<AddPfUsecase>(() => AddPfUsecase(pfRepo: getIt()));
  getIt.registerLazySingleton<PfListUsecase>(() => PfListUsecase(pfRepo: getIt()));
  getIt.registerLazySingleton<PfStore>(() => PfStore());


  getIt.registerLazySingleton<EsicRemoteRepo>(() => EsicImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<EsicRepo>(() => EsicImplRepo(esicRemoteRepo: getIt()));
  getIt.registerLazySingleton<EsicListUsecase>(() => EsicListUsecase(esicRepo: getIt()));
  getIt.registerLazySingleton<AddEsicUsecase>(() => AddEsicUsecase(esicRepo: getIt()));
  getIt.registerLazySingleton<EsicStore>(() => EsicStore());

  getIt.registerLazySingleton<BonusRemoteRepo>(() => BonusImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<BonusRepo>(() => BonusImplRepo(bonusRemoteRepo: getIt()));
  getIt.registerLazySingleton<BonusListUseCase>(() => BonusListUseCase(bonusRepo: getIt()));
  getIt.registerLazySingleton<AddBonusUseCase>(() => AddBonusUseCase(bonusRepo: getIt()));
  getIt.registerLazySingleton<BonusStore>(() => BonusStore());

  getIt.registerLazySingleton<LeavesRemoteRepo>(() => LeavesImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<LeavesRepo>(() => LeavesImplRepo(leavesRemoteRepo: getIt()));
  getIt.registerLazySingleton<LeavesListUseCase>(() => LeavesListUseCase(leavesRepo: getIt()));
  getIt.registerLazySingleton<AddLeavesUseCase>(() => AddLeavesUseCase(leavesRepo: getIt()));
  getIt.registerLazySingleton<LeavesStore>(() => LeavesStore());

  getIt.registerLazySingleton<ProfileRemoteRepo>(() => ProfileImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileImplRepo(profileRemoteRepo: getIt()));
  getIt.registerLazySingleton<FetchProfileUseCase>(() => FetchProfileUseCase(profileRepo: getIt()));
  getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(profileRepo: getIt()));
  getIt.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase(profileRepo: getIt()));
  getIt.registerLazySingleton<ProfileStore>(() => ProfileStore());

  getIt.registerLazySingleton<GstRemoteRepo>(() => GstImplRemoteRepo(apiService: getIt()));
  getIt.registerLazySingleton<GstRepo>(() => GstImplRepo(gstRemoteRepo: getIt()));
  getIt.registerLazySingleton<FetchGstListUseCase>(() => FetchGstListUseCase(gstRepo: getIt()));
  getIt.registerLazySingleton<AddGstUseCase>(() => AddGstUseCase(gstRepo: getIt()));
  getIt.registerLazySingleton<GstStore>(() => GstStore());


  getIt.registerLazySingleton<StatusStore>(()=> StatusStore());






}