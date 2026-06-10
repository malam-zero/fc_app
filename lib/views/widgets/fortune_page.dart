import 'package:fc_app/fortune_cookie.dart';
import 'package:fc_app/views/widgets/fortune_widget.dart';
import 'package:flutter/material.dart';

class FortunePage extends StatelessWidget {
  const FortunePage({
    super.key,
    required this.fortune,
    required this.nextForturneCallback,
  });

  final Fortune fortune;
  final VoidCallback nextForturneCallback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FortuneWidget(fortune: fortune),
          ElevatedButton(
            onPressed: nextForturneCallback,
            child: Text('Next Random Fortune'),
          ),
        ],
      ),
    );
  }
}
