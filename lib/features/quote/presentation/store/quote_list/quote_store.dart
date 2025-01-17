import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/usecase/usecase.dart';

import 'package:vir/core/utils/function_component.dart';
import 'package:vir/features/quote/domain/entities/quote_data.dart';
import 'package:vir/features/quote/domain/usecase/quote_usecase.dart';
import 'package:vir/injection.dart';

part 'quote_store.g.dart';

class QuoteStore = _QuoteStore with _$QuoteStore;

abstract class _QuoteStore with Store {
  @observable
  ObservableList<QuoteData> quotes = ObservableList<QuoteData>();

  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @action
  Future<void> fetchQuotes() async {
    isLoading = true;
    final data = await getIt<FetchQuoteListUseCase>().call(NoParams());

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      quotes = ObservableList.of(result.data);
    });
    isLoading = false;
  }

  @action
  Future<void> addQuote(dynamic request) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<AddQuoteUseCase>().call(AddQuoteParams(data: request));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';

      if(result.status==AppStrings.success){
        FunctionalWidget.showSnackBar(title: message, success: true);
        fetchQuotes(); // Refresh list after addition
        Get.back();
      }
      else{
        FunctionalWidget.showSnackBar(title: message, success: false);

      }
    }
    );
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> updateQuote(int id, dynamic request) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<UpdateQuoteUseCase>().call(UpdateQuoteParams(id: id, data: request));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';

      if(result.status==AppStrings.success) {

        FunctionalWidget.showSnackBar(title: message, success: true);
        fetchQuotes(); // Refresh list after update
        Get.back();

      }
      else{
        FunctionalWidget.showSnackBar(title: message, success: false);

      }
    });
    Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> deleteQuote(int id) async {
   Get.context!.loaderOverlay.show();
    final data = await getIt<DeleteQuoteUseCase>().call(DeleteQuoteParams(id: id));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';

      if(result.status==AppStrings.success){
        FunctionalWidget.showSnackBar(title: message, success: true);
        quotes.removeWhere((quote) => quote.id == id); // Remove quote from local list
      }
      else{
        FunctionalWidget.showSnackBar(title: message, success: false);

      }
    });
   Get.context!.loaderOverlay.hide();

  }

  @action
  Future<void> sendMail(int id) async {
    Get.context!.loaderOverlay.show();

    final data = await getIt<SendMailUseCase>().call(SendMailParams(id: id));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      message = result.message ?? '';

      if(result.status==AppStrings.success){
        FunctionalWidget.showSnackBar(title: message, success: true);
      }
      else{
        FunctionalWidget.showSnackBar(title: message, success: false);

      }
    });
    Get.context!.loaderOverlay.hide();

  }
}
