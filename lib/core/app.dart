import 'package:crypto_benefit/app/presentation/modules/home/home.page.dart';
import 'package:crypto_benefit/core/values/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // Application root (define the app theme, title, and start activity)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crypto.com Benefit',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomePage());
  }
}
