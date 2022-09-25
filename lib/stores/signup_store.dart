import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_spark/helpers/extensions.dart';
import 'package:xlo_spark/repositories/user_repository.dart';
import 'package:xlo_spark/stores/user_manager_store.dart';

import '../models/user.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {

  @observable
  String _name = '';

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != '' && name.length > 6;
  String? get nameError {
    if (name == '' || nameValid) {
      return null;
    }
    else if (name.isEmpty) {
      return 'Campo de preenchimento obrigatório.';
    }
    else {
      return 'Nome muito curto.';
    }
  }

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
  String phone = '';

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != '' && phone.length >= 14;

  String? get phoneError {
    if (phone == '' || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo de preenchimento obrigatório';
    else
      return 'Número de telemóvel inválido.';
  }

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != '' && pass1.length >= 6;

  String? get pass1Error {
    if (pass1 == '' || pass1Valid) {
      return null;
    }
    else if (pass1.isEmpty) {
      return 'Campo de preenchimento obrigatório.';
    }
    else {
      return 'Senha muito curta.';
    }
  }

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != '' && pass2 == pass1;

  String? get pass2Error {
    if (pass2 == '' || pass2Valid) {
      return null;
    }
    else if (pass2.isEmpty) {
      return 'Campo de preenchimento obrigatório.';
    }
    else {
      return 'As senhas não coincidem.';
    }
  }

  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  dynamic get signupPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: pass1,
    );

    try {
      final resultUser = await UserRepository().signUp(user);

      GetIt.I<UserManagerStore>().setUser(resultUser);

    } catch(e) {
      error = e.toString();
    }

    loading = false;
  }
}