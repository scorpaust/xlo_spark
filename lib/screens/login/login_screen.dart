import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_spark/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
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
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[900]),
                            ),
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
                            const SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(), isDense: true),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3, bottom: 4),
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
                            const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(), isDense: true),
                              obscureText: true,
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(top: 20, bottom: 12),
                              child: RaisedButton(
                                color: Colors.orange,
                                child: Text('ENTRAR'),
                                textColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                onPressed: () {},
                              )
                            ),
                            const Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  const Text(
                                    'Não tem uma conta?',
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => SignUpScreen()));

                                    },
                                    child: const Text(
                                      'Registe-se',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple,
                                        fontSize: 16
                                      ),
                                    ),

                                  )
                                ],
                              )
                            )
                          ],
                        ))),
              ))),
    );
  }
}
