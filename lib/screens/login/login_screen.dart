import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_spark/components/custom_drawer/error_box.dart';
import 'package:xlo_spark/screens/signup/signup_screen.dart';

import '../../stores/login_store.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
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
                        Text(
                          'Acessar com E-mail:',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[900]),
                        ),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ErrorBox(
                              message: loginStore.error,
                            ),
                          );
                        }),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 3, bottom: 4, top: 8),
                            child: Text(
                              'E-mail',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )),
                        Observer(builder: (_) {
                          return SizedBox(
                            width: 100,
                            child: TextField(
                              enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  errorText: loginStore.emailError),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: loginStore.setEmail,
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Senha',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              GestureDetector(
                                child: const Text('Esqueceu-se da sua senha?',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple)),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Observer(builder: (_) {
                          return TextField(
                            enabled: !loginStore.loading,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                errorText: loginStore.passwordError),
                            obscureText: true,
                            onChanged: loginStore.setPassword,
                          );
                        }),
                        Observer(builder: (_) {
                          return Container(
                              height: 40,
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 12),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.resolveWith<double>(
                                          (Set<MaterialState> states) {
                                    return 0.0;
                                  }),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return Colors.orange.withAlpha(120);
                                    } else {
                                      return Colors.orange;
                                    }
                                  }),
                                ),
                                child: loginStore.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white))
                                    : Text('ENTRAR'),
                                onPressed: loginStore.loginPressed,
                              ));
                        }),
                        const Divider(color: Colors.black),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text('Não tem uma conta?',
                                    style: TextStyle(fontSize: 16)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => SignUpScreen()));
                                  },
                                  child: const Text(
                                    'Registe-se',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ))),
          ))),
    );
  }
}
