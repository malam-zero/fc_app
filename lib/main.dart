import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = FortuneCookieViewModel(FortuneCookieModel());
    // print("here at main.app");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fortune Cookie App'),
          centerTitle: true,
          backgroundColor: Color(0xF80C8F68),
        ),
        body: const Center(child: Text('Check Console for data check')),
      ),
    );
  }
}
