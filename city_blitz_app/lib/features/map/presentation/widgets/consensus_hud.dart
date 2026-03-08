import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/consensus/consensus_state.dart';
import 'explainability_sheet.dart';

/// Bottom HUD panel displaying the consensus voting results.
///
/// Shows the top Red-Zone, individual agent votes, and the
/// Priority Alpha / Standard verdict with a glassmorphic design.
class ConsensusHud extends StatelessWidget {
  const ConsensusHud({
    super.key,
    required this.consensusAsync,
  });

  final AsyncValue<ConsensusState?> consensusAsync;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: consensusAsync.when(
        data: (consensus) => consensus == null
            ? _buildNoRedZone()
            : GestureDetector(
                onTap: () {
                  HapticFeedback.heavyImpact();
                  ExplainabilitySheet.show(context, consensus);
                },
                child: _buildConsensusPanel(consensus),
              ),
        loading: () => _buildLoadingState(),
        error: (e, _) => _buildErrorState(e),
      ),
    );
  }

  Widget _buildConsensusPanel(ConsensusState consensus) {
    final isPriorityAlpha = consensus.promotedToPriorityAlpha;
    final accentColor =
        isPriorityAlpha ? const Color(0xFFFF1744) : const Color(0xFFFFA726);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header: location + priority badge ──
        Row(
          children: [
            Icon(
              isPriorityAlpha
                  ? Icons.error_rounded
                  : Icons.info_outline_rounded,
              color: accentColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                consensus.location,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accentColor.withValues(alpha: 0.5)),
              ),
              child: Text(
                consensus.priority.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: accentColor,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // ── Agent votes row ──
        Row(
          children: [
            _buildVoteChip(
              '🏠 Resident',
              'Vibe ${consensus.vibeScore.toStringAsFixed(2)}',
              consensus.residentUrgent,
            ),
            const SizedBox(width: 8),
            _buildVoteChip(
              '🏛️ Municipal',
              'Friction ${consensus.frictionScore.toStringAsFixed(2)}',
              consensus.municipalUrgent,
            ),
            const SizedBox(width: 8),
            _buildVoteChip(
              '💰 Economy',
              'ROI \$${consensus.estimatedRoi.toStringAsFixed(0)}',
              consensus.economyUrgent,
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Verdict bar ──
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Text(
                'VERDICT',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: accentColor.withValues(alpha: 0.8),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  consensus.commandVerdict,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVoteChip(String label, String detail, bool isUrgent) {
    final color = isUrgent ? const Color(0xFFFF1744) : const Color(0xFF4CAF50);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              detail,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Icon(
              isUrgent ? Icons.cancel : Icons.check_circle,
              size: 14,
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoRedZone() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shield_outlined, color: Colors.greenAccent, size: 20),
        SizedBox(width: 8),
        Text(
          'No Red-Zone detected — all clear',
          style: TextStyle(
            fontSize: 13,
            color: Colors.greenAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.cyanAccent.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Loading consensus data…',
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(Object error) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(color: Colors.redAccent.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.redAccent, size: 18),
          SizedBox(width: 8),
          Text(
            'ENCRYPTED LINK LOST',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
