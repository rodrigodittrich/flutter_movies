import 'package:flutter/material.dart';
import '../layers/presentation/ui/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter movies',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}