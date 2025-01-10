import 'package:mobx/mobx.dart';

part 'add_new_quote_store.g.dart';

class AddNewQuoteStore = AddNewQuote with _$AddNewQuoteStore;

abstract class AddNewQuote with Store {
  @observable
  int tabFirst = 0;

  @observable
  bool companyAdd = false;

  @observable
  bool subjectAdd = false;

  late final ReactionDisposer _disposer; // For disposing reactions if used

  AddNewQuote() {
    _disposer = reaction(
          (_) => tabFirst,
          (int newValue) {

      },
    );
  }

  @action
  void changeTab(int index) {
    tabFirst = index;
  }

  @action
  void addCompany() {
    companyAdd = !companyAdd;
  }

  @action
  void addSubject() {
    subjectAdd = !subjectAdd;
  }

  void dispose() {

    _disposer(); // Dispose of the reaction
  }
}
