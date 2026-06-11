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
            color: Theme.of(context).colorScheme.surface,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Icon(
                    Icons.cookie_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      fortune.fortune,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Badge(
            label: Text(
              fortune.type,
              style: GoogleFonts.almendra(
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).primaryColor, // Gold text
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            backgroundColor: Theme.of(
              context,
            ).primaryColor.withValues(alpha: 0.2), // Faded Gold
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
