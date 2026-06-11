import 'package:fc_app/utils/fortune_cookie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FortuneWidget extends StatelessWidget {
  const FortuneWidget({super.key, required this.fortune});
  final Fortune fortune;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Color(0x6FB5C7C2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Text(
                  fortune.fortune,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.snowburstOne(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Badge(
            label: Text(
              fortune.type,
              style: GoogleFonts.almendra(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            backgroundColor: const Color(0x6FB5C7C2),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
          ),
          //   Text(
          //     'Type: ${fortune.type}',
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
        ],
      ),
    );
  }
}
