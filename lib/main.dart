import 'package:flutter/material.dart';
import 'src/core/app.dart';
import 'src/core/inject/inject.dart';

void main() async {
  Inject.init();
  runApp(const App());
}