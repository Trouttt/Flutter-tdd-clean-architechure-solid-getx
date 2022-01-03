import 'package:flutter/material.dart';

import '../components/components.dart';

class LoginPage extends StatelessWidget {
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
      width: width,
      height: height,
      child: Column(
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
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.primaryVariant,
                        )),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.02, bottom: height * 0.05),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          )),
                      obscureText: true,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Entrar'.toUpperCase())),
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
