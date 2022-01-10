import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
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

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    // verifica se ele pode esconder
    Navigator.of(context).pop(); //esconde o modal
  }
}
