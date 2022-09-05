import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_spark/screens/login/login_screen.dart';
import 'package:xlo_spark/screens/signup/components/field_title.dart';

class SignUpScreen extends StatelessWidget {
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
          child: Card(margin: const EdgeInsets.symmetric(horizontal: 32),
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá nos seus anúncios',
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: João P.',
                        isDense: true
                      ),
                    ),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação',
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: joao@gmail.com',
                          isDense: true
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Número de Telemóvel',
                      subtitle: 'Proteja a sua conta',
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: +351 916 756 625',
                          isDense: true
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                    ),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, maiúsculas e minúsculas, números e caracteres especiais',
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a sua senha',
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16,),
                    Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          color: Colors.orange,
                          child: Text('REGISTAR'),
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
                                'Já tem uma conta? ',
                                style: TextStyle(fontSize: 16)
                            ),
                            GestureDetector(
                              onTap: Navigator.of(context).pop,
                              child: const Text(
                                'Entrar',
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
                )
              )

          ),
        )
      )
    );
  }
}
