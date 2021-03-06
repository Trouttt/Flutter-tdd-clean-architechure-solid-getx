import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(
        context); //com isso, tenho acesso as streams
    return StreamBuilder<String>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              labelText: 'Email',
              icon: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
            onChanged: presenter.validateEmail,
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}
