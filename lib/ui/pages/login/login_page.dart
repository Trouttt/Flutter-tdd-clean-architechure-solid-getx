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
    return Scaffold(
        body: SingleChildScrollView(
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
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
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
                                errorText: snapshot.data),
                            obscureText: true,
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: null, child: Text('Entrar'.toUpperCase())),
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
    )));
  }
}
