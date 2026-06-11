import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:fc_app/views/widgets/fortune_widget.dart';
import 'package:flutter/material.dart';

class FortunePage extends StatelessWidget {
  const FortunePage({
    super.key,
    required this.fortune,
    required this.nextFortuneCallback,
  });

  final Fortune fortune;
  final VoidCallback nextFortuneCallback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FortuneWidget(fortune: fortune),
          ElevatedButton(
            onPressed: nextFortuneCallback,
            child: Text('Next Random Fortune'),
          ),
        ],
      ),
    );
  }
}
