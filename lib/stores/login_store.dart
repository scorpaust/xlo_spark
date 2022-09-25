import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_spark/helpers/extensions.dart';
import 'package:xlo_spark/stores/user_manager_store.dart';

import '../repositories/user_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String _email = '';

  String get email => _email;

  @action
  void setEmail(String value) => _email = value;

  @computed
  bool get emailValid => email != '' && email.isEmailValid();

  String? get emailError {
    if (email == '' || emailValid) {
      return null;
    }
    else if (email.isEmpty) {
      return 'Campo de preenchimento obrigatório.';
    }
    else
    {
      return 'E-mail inválido.';
    }
  }

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != '' && password.length >= 6;

  String? get passwordError {
    if (password == '' || passwordValid) {
      return null;
    }
    else if (password.isEmpty) {
      return 'Campo de preenchimento obrigatório.';
    }
    else {
      return 'Senha muito curta.';
    }
  }

  @computed
  dynamic get loginPressed => emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
    }
    catch(e) {
      error = e.toString();
    }

    loading = false;
  }

}