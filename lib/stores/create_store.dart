import 'package:mobx/mobx.dart';
import 'package:xlo_spark/models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category category = Category(id: '', description: '');

  @action
  void setCategory(Category value) => category = value;
}
