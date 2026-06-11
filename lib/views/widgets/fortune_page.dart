import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:fc_app/views/widgets/fortune_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            "Your fortune is: ",
            style: GoogleFonts.almendra(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight(600),
            ),
          ),
          FortuneWidget(fortune: fortune),
          ElevatedButton(
            onPressed: nextFortuneCallback,
            child: Text(
              'Next Random Fortune',
              style: GoogleFonts.imFellEnglishSc(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: const Color(0xFF2D4931),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
