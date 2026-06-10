import 'package:fc_app/model/fortune_cookie_model.dart';
import 'package:fc_app/viewModel/fortune_cookie_view_model.dart';
import 'package:fc_app/views/widgets/fortune_page.dart';
import 'package:flutter/material.dart';

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
    viewModel.fetchCookie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fortune Cookie"), centerTitle: true),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return switch ((
            viewModel.isLoading,
            viewModel.fortune,
            viewModel.error,
          )) {
            (true, _, _) => const Center(child: CircularProgressIndicator()),
            (_, _, final Exception error) => Center(
              child: Text("Error: $error"),
            ),
            (_, final fortune?, _) => FortunePage(
              fortune: fortune,
              nextForturneCallback: () => viewModel.fetchCookie(),
            ),
            _ => const Center(child: Text("Why SomeThing Went South")),
          };
        },
      ),
    );
  }
}




