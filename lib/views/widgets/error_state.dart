import 'package:fc_app/viewModel/fortune_cookie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorState extends StatelessWidget {
  final Exception error;
  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FortuneViewModel>(context, listen: false);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 60),
            const SizedBox(height: 16),
            Text("Oh no!", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => viewModel.fetchFortune(),
              icon: const Icon(Icons.refresh),
              label: const Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
