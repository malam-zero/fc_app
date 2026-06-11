import 'package:fc_app/viewModel/fortune_cookie_view_model.dart';
import 'package:fc_app/views/widgets/error_state.dart';
import 'package:fc_app/views/widgets/fortune_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FortuneView extends StatefulWidget {
  const FortuneView({super.key});

  @override
  State<FortuneView> createState() => _FortuneViewState();
}

class _FortuneViewState extends State<FortuneView> {
  //   final FortuneCookieViewModel viewModel = FortuneCookieViewModel(
  //     FortuneCookieModel(),
  //   );

  @override
  void initState() {
    super.initState();

    // This tells Flutter to run the code AFTER the build process is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FortuneCookieViewModel>(
        context,
        listen: false,
      ).fetchFortune();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FortuneCookieViewModel>(context);
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
                child: ErrorState(error: error),
              ),
              (_, final fortune?, _) => FortunePage(
                fortune: fortune,
                nextFortuneCallback: () => viewModel.fetchFortune(),
              ),
              _ => const Center(child: Text("Why SomeThing Went South?")),
            };
          },
        ),
      ),
    );
  }
}
