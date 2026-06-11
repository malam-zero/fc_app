import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/viewModel/fortune_cookie_view_model.dart';
import 'package:fc_app/views/widgets/fortune_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FortuneView extends StatefulWidget {
  const FortuneView({super.key});

  @override
  State<FortuneView> createState() => _FortuneViewState();
}

class _FortuneViewState extends State<FortuneView> {
  final FortuneCookieViewModel viewModel = FortuneCookieViewModel(
    FortuneCookieModel(),
  );

  @override
  void initState() {
    super.initState();
    viewModel.fetchFortune();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fortune Cookie",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        // backgroundColor: Color(0xFF7DAF79),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return switch ((
              viewModel.isLoading,
              viewModel.fortune,
              viewModel.error,
            )) {
              (true, _, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/cookie_loading.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Cracking your cookie...",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              (_, _, final Exception error) => Center(
                child: Text("Error: $error"),
              ),
              (_, final fortune?, _) => FortunePage(
                fortune: fortune,
                nextFortuneCallback: () => viewModel.fetchFortune(),
              ),
              _ => const Center(child: Text("Why SomeThing Went South")),
            };
          },
        ),
      ),
    );
  }
}
