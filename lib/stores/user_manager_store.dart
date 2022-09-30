import 'package:mobx/mobx.dart';
import 'package:xlo_spark/repositories/user_repository.dart';

import '../models/user.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  User user = User(name: '', email: '', phone: '');

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user.name != '';

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();

    setUser(user!);
  }
}
