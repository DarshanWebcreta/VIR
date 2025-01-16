import 'package:mobx/mobx.dart';
import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/company/presentation/store/company_store.dart';
import 'package:vir/features/quote/data/model/quote_view_model.dart';
import 'package:vir/features/quote/domain/entities/view_quote_response.dart';
import 'package:vir/features/quote/domain/usecase/quote_usecase.dart';

import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/injection.dart';

part 'add_new_quote_store.g.dart';
final company = getIt<CompanyStore>();
final subject = getIt<SubjectStore>();
class AddNewQuoteStore = AddNewQuote with _$AddNewQuoteStore;

abstract class AddNewQuote with Store {


  @observable
  bool isLoading = false;



  @observable
  QuoteViewModel? quoteViewModel;

  late final ReactionDisposer _disposer; // For disposing reactions if used

  // AddNewQuote() {
  //   _disposer = reaction(
  //         (_) => isLoading==false,
  //         (int newValue) {
  //
  //     },
  //   );
  // }


  void dispose() {

   // _disposer(); // Dispose of the reaction
  }
  @action
  Future<void> setDropDownValues({required QuoteDetails quote}) async {
    quote.companyName = company.companyList.firstWhere((element) => element.id==quote.companyId,).companyName;
    quote.subjectName = subject.subjectList.firstWhere((element) => element.id==quote.subjectId,).name;
  }

  @action
  Future<void> changeSubject({required int id,required String subjectName,required QuoteDetails data}) async {
    data.subjectId = id ;
    data.subjectName =subjectName ;
    print("hii");
  }
  @action
  Future<void> fetchQuote({required int id}) async {
    isLoading = true;
    final data = await getIt<ViewQuoteUseCase>().call(ViewQuoteParams(id:id ));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      quoteViewModel = result;
      setDropDownValues(quote: quoteViewModel!.data);
    });
    isLoading = false;
  }
}
