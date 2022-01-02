import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(color: Colors.grey),
      width: width,
      height: height,
      child: Column(
        children: <Widget>[
          Container(
            child: const Image(image: AssetImage('lib/ui/assets/logo.png')),
          ),
          Text('Login'.toUpperCase()),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email', icon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text('Entrar'.toUpperCase())),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    label: Text('Criar conta'))
              ],
            ),
          )
        ],
      ),
    )));
  }
}
