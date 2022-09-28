import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_spark/screens/signup/components/field_title.dart';
import 'package:xlo_spark/stores/signup_store.dart';

import '../../components/custom_drawer/error_box.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = new SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registo'),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 8),
                child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Observer(builder: (_) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ErrorBox(message: signupStore.error),
                              );
                            }),
                            FieldTitle(
                              title: 'Apelido',
                              subtitle: 'Como aparecerá nos seus anúncios',
                            ),
                            Observer(builder: (_) {
                              return TextField(
                                enabled: !signupStore.loading,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Exemplo: João P.',
                                    isDense: true,
                                    errorText: signupStore.nameError),
                                onChanged: signupStore.setName,
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            FieldTitle(
                              title: 'E-mail',
                              subtitle: 'Enviaremos um e-mail de confirmação',
                            ),
                            Observer(builder: (_) {
                              return TextField(
                                  enabled: !signupStore.loading,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Exemplo: joao@gmail.com',
                                      isDense: true,
                                      errorText: signupStore.emailError),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  onChanged: signupStore.setEmail);
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            FieldTitle(
                              title: 'Número de Telemóvel',
                              subtitle: 'Proteja a sua conta',
                            ),
                            Observer(builder: (_) {
                              return TextField(
                                enabled: !signupStore.loading,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Exemplo: 00351916756625',
                                    isDense: true,
                                    errorText: signupStore.phoneError),
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                                onChanged: signupStore.setPhone,
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            FieldTitle(
                              title: 'Senha',
                              subtitle:
                                  'Use letras, maiúsculas e minúsculas, números e caracteres especiais',
                            ),
                            Observer(builder: (_) {
                              return TextField(
                                enabled: !signupStore.loading,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    errorText: signupStore.pass1Error),
                                obscureText: true,
                                onChanged: signupStore.setPass1,
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            FieldTitle(
                              title: 'Confirmar Senha',
                              subtitle: 'Repita a sua senha',
                            ),
                            Observer(builder: (_) {
                              return TextField(
                                enabled: !signupStore.loading,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    errorText: signupStore.pass2Error),
                                obscureText: true,
                                onChanged: signupStore.setPass2,
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            Observer(builder: (_) {
                              return Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 12),
                                  child: RaisedButton(
                                    color: Colors.orange,
                                    disabledColor: Colors.orange.withAlpha(120),
                                    child: signupStore.loading
                                        ? const CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white),
                                          )
                                        : Text('REGISTAR'),
                                    textColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: signupStore.signupPressed,
                                  ));
                            }),
                            const Divider(color: Colors.black),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Text('Já tem uma conta? ',
                                        style: TextStyle(fontSize: 16)),
                                    GestureDetector(
                                      onTap: Navigator.of(context).pop,
                                      child: const Text(
                                        'Entrar',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.purple,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ))),
              ),
            )));
  }
}
