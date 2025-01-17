
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/utils/function_component.dart';

import 'package:vir/features/quote/domain/entities/pivot.dart';
import 'package:vir/features/quote/domain/entities/quote_category.dart';
import 'package:vir/features/quote/domain/usecase/quote_usecase.dart';
import 'package:vir/features/t&c/presentation/store/terms_store.dart';


import 'package:vir/injection.dart';

part 'add_new_quote_store.g.dart';

final tc = getIt<TermsStore>();
class AddNewQuoteStore = _AddNewQuoteStore with _$AddNewQuoteStore;

abstract class _AddNewQuoteStore with Store {
  @observable
  bool isLoading = false;

  @observable
  int companyId = 0;

  @observable
  int subjectId = 0;

  @observable
  bool sendEmail = false;

  @observable
  bool cGst = false;

  @observable
  bool sGst = false;

  @observable
  bool iGst = false;

  @observable
  TextEditingController name = TextEditingController(text: '');

  @observable
  TextEditingController phone = TextEditingController(text: '');

  @observable
  TextEditingController address = TextEditingController(text: '');

  @observable
  TextEditingController address1 = TextEditingController(text: '');

  @observable
  TextEditingController city = TextEditingController(text: '');

  @observable
  TextEditingController dictrict = TextEditingController(text: '');

  @observable
  TextEditingController gstNo = TextEditingController(text: '');

  @observable
  TextEditingController pincode = TextEditingController(text: '');

  @observable
  TextEditingController email = TextEditingController(text: '');

  @observable
  String rateHours = '';

  @observable
  String status = '';

  @observable
  ObservableList<String> selectedTerms = ObservableList<String>();

  @observable
  List<QuoteViewCategory> categories = [QuoteViewCategory(
      id: 0,
      name: '',
      status: '',
      createdAt: '',
      updatedAt: '',
      pivot: CategoryPivot(
          quoteId: 0,
          categoryId: 0,

          wages: TextEditingController(text: ''),
          allowance: TextEditingController(text: ''),
          applyPercentageForHra: 0,
          applyPercentageForAgency: 0,
          hraCharge: TextEditingController(text: ''),
          agencyCharge: TextEditingController(text: ''),
          hra: 0,
          proFund: 0,
          esic: 0,
          bonus: 0,
          leave: 0,
          createdAt: '',
          updatedAt: ''))];

  @action
  Future<void> fetchQuote({required int id}) async {
    isLoading = true;
    final data = await getIt<ViewQuoteUseCase>().call(ViewQuoteParams(id: id));

    data.fold((failure) {
      FunctionalWidget.showSnackBar(title: failure.message, success: false);
    }, (result) {
      if (result.status == AppStrings.success) {
        companyId = result.data.companyId;
        subjectId = result.data.subjectId;
        subjectId = result.data.subjectId;
        address.text = result.data.address;
        phone.text = result.data.phoneNo;
        address1.text = result.data.address;
        name.text = result.data.name;
        city.text = result.data.city;
        pincode.text = result.data.pincode;
        email.text = result.data.email ?? '';
        dictrict.text = result.data.district ?? '';
        gstNo.text = result.data.gstNo ?? '';
        rateHours = result.data.rateHours;
        status = result.data.status;
        categories = result.data.categories;
        cGst = result.data.applyCgst==0?false:true;
        sGst = result.data.applySgst==0?false:true;
        iGst = result.data.applyIgst==0?false:true;
        selectedTerms = ObservableList.of(result.data.terms);
      } else {
        FunctionalWidget.showSnackBar(title: result.message, success: false);
      }
    });
    isLoading = false;
  }

  @action
  selectCategory({required int index, required int categoryId}) {
    categories[index].pivot.categoryId = categoryId;
    // If you replace the entire list (less optimal):
    categories = [...categories];
  }

  @action
  selectAllTerms() {
    if(selectedTerms.length ==tc.termsList.length ){
      selectedTerms.clear();
    }
    else {
      selectedTerms =
          ObservableList.of(tc.termsList.map((e) => e.id.toString()).toList());
    }
  }

  @action
  setSendEmail() {
    sendEmail = !sendEmail;

  }

  @action
  setCgst() {
    cGst = !cGst;
  }
  @action
  setSgst() {
    sGst = !sGst;
  }
  @action
  setIgst() {
    iGst = !iGst;
  }
  @action
  applyAgency({
    required int index,
  }) {
    categories[index].pivot.applyPercentageForAgency =
        categories[index].pivot.applyPercentageForAgency == 0 ? 1 : 0;
    // If you replace the entire list (less optimal):
    categories = [...categories];
  }

  @action
  selectTerms({
    required String id,
  }) {
    if(selectedTerms.contains(id)){
      selectedTerms.remove(id);
    }
    else{
      selectedTerms.add(id);
    }

    selectedTerms = ObservableList.of(selectedTerms);

  }

  @action
  addCategory(
      ) {
    // If you replace the entire list (less optimal):
    categories.add(
        QuoteViewCategory(
        id: 0,
        name: '',
        status: '',
        createdAt: '',
        updatedAt: '',
        pivot: CategoryPivot(
            quoteId: 0,
            categoryId: 0,

            wages: TextEditingController(text: ''),
            allowance: TextEditingController(text: ''),
            applyPercentageForHra: 0,
            applyPercentageForAgency: 0,
            hraCharge: TextEditingController(text: ''),
            agencyCharge: TextEditingController(text: ''),
            hra: 0,
            proFund: 0,
            esic: 0,
            bonus: 0,
            leave: 0,
            createdAt: '',
            updatedAt: '')));
    categories = [...categories];

  }

  @action
  removeCategory({
    required int index,
  }) {
    categories.removeAt(index);
    // If you replace the entire list (less optimal):
    categories = [...categories];
  }
  
  @action
  applyHRA({
    required int index,
  }) {
    categories[index].pivot.applyPercentageForHra =
        categories[index].pivot.applyPercentageForHra == 0 ? 1 : 0;
    // If you replace the entire list (less optimal):
    categories = [...categories];
  }

  @action
  allSinglePolicy({required int index, required int val}) {
    if (val == 0) {
      categories[index].pivot.hra = categories[index].pivot.hra == 0 ? 1 : 0;
    } else if (val == 1) {
      categories[index].pivot.proFund =
          categories[index].pivot.proFund == 0 ? 1 : 0;
    } else if (val == 2) {
      categories[index].pivot.esic = categories[index].pivot.esic == 0 ? 1 : 0;
    } else if (val == 3) {
      categories[index].pivot.bonus =
          categories[index].pivot.bonus == 0 ? 1 : 0;
    } else {
      categories[index].pivot.leave =
          categories[index].pivot.leave == 0 ? 1 : 0;
    }

    // If you replace the entire list (less optimal):
    categories = [...categories];
  }
}
