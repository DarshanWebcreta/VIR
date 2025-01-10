


import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

class MainScreenTab = MainScreen with _$MainScreenTab;

abstract class MainScreen with Store {




  @observable
  int index = 0;

  @action
  void changeTab(int index) {
    this.index = index;
  }
}