import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

/// Satellite Sweep – full-screen scanning animation that plays
/// when the map first loads. Simulates a radar/satellite pass
/// scanning Montgomery for Red-Zones.
class SatelliteSweep extends StatefulWidget {
  const SatelliteSweep({super.key});

  @override
  State<SatelliteSweep> createState() => _SatelliteSweepState();
}

class _SatelliteSweepState extends State<SatelliteSweep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sweepPosition;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    // Sweep line moves from top to bottom
    _sweepPosition = Tween<double>(begin: -0.1, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Fade out toward the end
    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 25),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Stack(
            children: [
              // Scan overlay tint
              Container(
                color: const Color(0xFF00E5FF).withValues(alpha: 0.03),
              ),

              // Moving scan line
              Positioned(
                top: MediaQuery.of(context).size.height * _sweepPosition.value,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Glow above scan line
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(0xFF00E5FF).withValues(alpha: 0.08),
                            const Color(0xFF00E5FF).withValues(alpha: 0.15),
                          ],
                        ),
                      ),
                    ),
                    // The actual scan line
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00E5FF).withValues(alpha: 0.6),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            const Color(0xFF00E5FF).withValues(alpha: 0.8),
                            const Color(0xFF00E5FF),
                            const Color(0xFF00E5FF).withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    // Trail below scan line
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF00E5FF).withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Status text
              Positioned(
                top: MediaQuery.of(context).padding.top + 80,
                left: 0,
                right: 0,
                child: FadeIn(
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      Text(
                        'SATELLITE SWEEP',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF00E5FF).withValues(alpha: 0.9),
                          letterSpacing: 4.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Scanning Montgomery Red-Zones…',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.5),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
