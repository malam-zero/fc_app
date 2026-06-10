import 'package:fc_app/fortune_cookie.dart';
import 'package:flutter/material.dart';

class FortuneWidget extends StatelessWidget {
  const FortuneWidget({super.key, required this.fortune});
  final Fortune fortune;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fortune.fortune, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 10),
          Text(
            'Type: ${fortune.type}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
