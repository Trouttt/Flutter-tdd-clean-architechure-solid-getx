import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(body: Builder(builder: (context) {
      // o builder permite executar lógica
      presenter.isLoadingStream.listen((isLoading) {
        if (isLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => SimpleDialog(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Aguarde...",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  )); // false no barrierDismissible não deixa fechar o modal clickando fora
        }
      });
      return SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginHeader(height: height, width: width),
            const Headline1(
              text: 'Login',
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.1),
              child: Form(
                child: Column(
                  children: <Widget>[
                    StreamBuilder<String>(
                        stream: presenter.emailErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            decoration: InputDecoration(
                              errorText: snapshot.data?.isEmpty == true
                                  ? null
                                  : snapshot.data,
                              labelText: 'Email',
                              icon: Icon(
                                Icons.email,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryVariant,
                              ),
                            ),
                            onChanged: presenter.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02, bottom: height * 0.05),
                      child: StreamBuilder<String>(
                          stream: presenter.passwordErrorStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              onChanged: presenter.validatePassword,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                icon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryVariant,
                                ),
                                errorText: snapshot.data?.isEmpty == true
                                    ? null
                                    : snapshot.data,
                              ),
                              obscureText: true,
                            );
                          }),
                    ),
                    StreamBuilder<bool>(
                        stream: presenter.isFormValidStream,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                              onPressed:
                                  snapshot.data == true ? presenter.auth : null,
                              child: Text('Entrar'.toUpperCase()));
                        }),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                        label: Text('Criar conta'))
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    }));
  }
}
