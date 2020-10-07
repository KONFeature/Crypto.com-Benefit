import 'package:crypto_benefit/core/app.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';

void main() async {
  setupInjection();
  runApp(App());
}