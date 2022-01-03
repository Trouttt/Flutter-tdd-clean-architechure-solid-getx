import 'package:flutter/material.dart';

import '../pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(136, 14, 79, 1);
    const Color primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
    const Color primaryColorLight = Color.fromRGBO(188, 71, 123, 1);
    const ColorScheme colorScheme = ColorScheme(
      primary: primaryColor, // <---- I set white color here
      primaryVariant: primaryColorDark,
      secondary: Color(0xFFEFF3F3),
      secondaryVariant: Color(0xFFFAFBFB),
      background: Color(0xFF636363),
      surface: Color(0xFF808080),
      onBackground: Colors.white,
      error: Color.fromRGBO(136, 14, 79, 1),
      onError: Color.fromRGBO(136, 14, 79, 1),
      onPrimary: Colors.white,
      onSecondary: Color(0xFF322942),
      onSurface: Color(0xFF241E30),
      brightness: Brightness.light,
    );

    return MaterialApp(
        title: '4Dev',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: colorScheme,
            backgroundColor: Colors.white,
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: primaryColorDark)),
            inputDecorationTheme: const InputDecorationTheme(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColorLight)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                alignLabelWithHint: true),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary:
                        primaryColor))), //splash é o efeito ao clickar no botão
        home: LoginPage());
  }
}
