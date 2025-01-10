
import 'package:mobx/mobx.dart';



part 'status_store.g.dart'; // Generated file

class StatusStore = _StatusStore with _$StatusStore;

abstract class _StatusStore with Store {



  @observable
  String status = '';



}
