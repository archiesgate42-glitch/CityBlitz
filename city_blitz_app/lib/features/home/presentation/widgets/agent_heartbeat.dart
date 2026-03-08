import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/log_providers.dart';
import '../../../../shared/services/log_repository.dart';

/// A dashboard widget that displays the real-time health of the Taro-XI agents.
class AgentHeartbeat extends ConsumerWidget {
  const AgentHeartbeat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the polling stream
    final heartbeatAsync = ref.watch(agentHeartbeatStreamProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.monitor_heart, color: Colors.cyanAccent, size: 20),
              const SizedBox(width: 8),
              const Text(
                'AGENT HEARTBEAT',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.cyanAccent,
                  letterSpacing: 1.5,
                ),
              ),
              const Spacer(),
              // A small pulsing indicator to show it's live
              _buildLivePulse(),
            ],
          ),
          const SizedBox(height: 20),
          heartbeatAsync.when(
            data: (state) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAgentCard('Janitor', state.janitorStatus),
                _buildAgentCard('Analyst', state.analystStatus),
                _buildAgentCard('Observer', state.observerStatus),
              ],
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (e, _) => Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                    const SizedBox(width: 8),
                    Text(
                      '[ CRITICAL ] Encrypted Link Lost\nRe-establishing connection...',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.redAccent.withValues(alpha: 0.9),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgentCard(String name, AgentStatus status) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status) {
      case AgentStatus.healthy:
        statusColor = Colors.greenAccent;
        statusIcon = Icons.check_circle_outline;
        statusText = 'HEALTHY';
        break;
      case AgentStatus.critical:
        statusColor = const Color(0xFFFF1744);
        statusIcon = Icons.error_outline;
        statusText = 'CRITICAL';
        break;
      case AgentStatus.unknown:
      default:
        statusColor = Colors.white38;
        statusIcon = Icons.help_outline;
        statusText = 'STANDBY';
        break;
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: statusColor.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(statusIcon, color: statusColor, size: 28),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: statusColor,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLivePulse() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'LIVE',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
