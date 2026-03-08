import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/consensus/consensus_state.dart';
import '../../../../shared/models/priority_roadmap.dart';
import '../../../../shared/services/inference_providers.dart';

/// Bottom sheet displaying the Explainability Engine output.
///
/// Features:
/// - Markdown/text display of the Orchestrator's decision logic.
/// - `fl_chart` visualization of Friction vs Vibe scores.
/// - Glassmorphic design matching the Antigravity UI.
class ExplainabilitySheet extends ConsumerWidget {
  const ExplainabilitySheet({
    super.key,
    required this.consensus,
  });

  final ConsensusState consensus;

  /// Helper to show the sheet with a premium modal animation.
  static Future<void> show(BuildContext context, ConsensusState consensus) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ExplainabilitySheet(consensus: consensus),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We already have the consensus state. We also want the roadmap to get the markdown.
    final roadmapAsync = ref.watch(priorityRoadmapProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E1A).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.all(
          color: const Color(0xFF00E5FF).withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00E5FF).withValues(alpha: 0.1),
            blurRadius: 40,
            spreadRadius: 5,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 24),
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Icon(Icons.psychology, color: Color(0xFF00E5FF)),
                const SizedBox(width: 12),
                const Text(
                  'ENGINE: TARO-XI',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00E5FF),
                    letterSpacing: 2.0,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              children: [
                Text(
                  'Explainability Report',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  consensus.location,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
                const SizedBox(height: 32),

                // ── 1. Chart ──
                const Text(
                  'METRIC DELTAS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: _buildChart(consensus),
                ),
                const SizedBox(height: 32),

                // ── 2. Markdown / Decision Logic ──
                const Text(
                  'DECISION LOGIC',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: roadmapAsync.when(
                    data: (roadmap) {
                      final markdown =
                          roadmap.explainability?.logTrace;
                      if (markdown == null || markdown.isEmpty) {
                        return const Text(
                          'No detailed logic provided by Orchestrator.',
                          style: TextStyle(color: Colors.white70),
                        );
                      }
                      // For this demo, we'll display the raw text. 
                      // (Adding a full markdown renderer is possible but raw is fine for hackathon scope).
                      return Text(
                        markdown,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      );
                    },
                    loading: () => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2)),
                    error: (_, __) => const Text(
                      'Failed to load decision logic.',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart(ConsensusState consensus) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceEvenly,
        maxY: 1.0,
        minY: 0,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Vibe',
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    );
                  case 1:
                    return const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Friction',
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide Y axis numbers
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: consensus.vibeScore,
                color: consensus.residentUrgent
                    ? const Color(0xFFFF1744)
                    : const Color(0xFF00E5FF),
                width: 40,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 1.0,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: consensus.frictionScore,
                color: consensus.municipalUrgent
                    ? const Color(0xFFFF1744)
                    : const Color(0xFFFF9800),
                width: 40,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 1.0,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
