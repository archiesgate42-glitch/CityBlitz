import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

/// The '[ BD ] Sentiment Verified' badge for the HUD.
///
/// Indicates that Bright Data web-sentiment analysis has been applied
/// to the current hotspot data. Designed with a premium glassmorphic style.
class BrightDataBadge extends StatelessWidget {
  const BrightDataBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Pulse(
      infinite: true,
      duration: const Duration(seconds: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A).withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF00E5FF).withValues(alpha: 0.4),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF).withValues(alpha: 0.15),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // BD icon container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF00E5FF).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFF00E5FF).withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: const Text(
                'BD',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF00E5FF),
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sentiment Verified',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  'BRIGHT DATA — WEB INTELLIGENCE',
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF00E5FF).withValues(alpha: 0.7),
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
