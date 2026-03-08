import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Represents the health status of a Taro-XI agent.
enum AgentStatus {
  healthy,
  critical,
  unknown,
}

/// A combined heartbeat state for the three main agents.
class AgentHeartbeatState {
  const AgentHeartbeatState({
    this.janitorStatus = AgentStatus.unknown,
    this.analystStatus = AgentStatus.unknown,
    this.observerStatus = AgentStatus.unknown,
    this.lastUpdated,
  });

  final AgentStatus janitorStatus;
  final AgentStatus analystStatus;
  final AgentStatus observerStatus;
  final DateTime? lastUpdated;

  AgentHeartbeatState copyWith({
    AgentStatus? janitorStatus,
    AgentStatus? analystStatus,
    AgentStatus? observerStatus,
    DateTime? lastUpdated,
  }) {
    return AgentHeartbeatState(
      janitorStatus: janitorStatus ?? this.janitorStatus,
      analystStatus: analystStatus ?? this.analystStatus,
      observerStatus: observerStatus ?? this.observerStatus,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

/// Reads and parses `orchestrator_agent.log` to determine agent health.
class LogRepository {
  LogRepository({String? basePath})
      : _basePath = basePath ?? _resolveDefaultBasePath();

  final String _basePath;

  /// Resolves the default path to `logs/` relative to the app root.
  static String _resolveDefaultBasePath() {
    final candidates = [
      '../logs', // from city_blitz_app/
      'logs', // from project root
      '../../logs', // fallback
    ];
    for (final path in candidates) {
      if (kIsWeb) break; // skip directory checks on web
      if (Directory(path).existsSync()) {
        return path;
      }
    }
    return '../logs'; // default
  }

  /// Parses the latest statuses from the log file.
  Future<AgentHeartbeatState> getLatestHeartbeat() async {
    // Web fallback for Hackathon demo
    if (kIsWeb) {
      return AgentHeartbeatState(
        janitorStatus: AgentStatus.healthy,
        analystStatus: AgentStatus.healthy,
        observerStatus: AgentStatus.healthy,
        lastUpdated: DateTime.now(),
      );
    }

    final file = File('$_basePath/orchestrator_agent.log');
    if (!await file.exists()) {
      return const AgentHeartbeatState(); // File not there yet
    }

    // Read the last N lines (or entirety if small) to find latest phase outcomes.
    // For simplicity, we just read lines and track the latest state per agent.
    try {
      final lines = await file.readAsLines();
      
      AgentStatus janitor = AgentStatus.unknown;
      AgentStatus analyst = AgentStatus.unknown;
      AgentStatus observer = AgentStatus.unknown;
      DateTime? latestTime;

      // Parse from top to bottom, so the last occurrence "wins"
      for (final line in lines) {
        if (line.trim().isEmpty) continue;
        try {
          final jsonMap = json.decode(line) as Map<String, dynamic>;
          final action = jsonMap['action'] as String?;
          final outcome = jsonMap['outcome'] as String?;
          final timestampStr = jsonMap['timestamp'] as String?;
          
          if (timestampStr != null) {
            final t = DateTime.tryParse(timestampStr);
            if (t != null && (latestTime == null || t.isAfter(latestTime))) {
              latestTime = t;
            }
          }

          if (action == 'janitor_phase') {
            if (outcome == 'success' || outcome == 'no_new_raw_data') {
              janitor = AgentStatus.healthy;
            } else if (outcome == 'critical_failure') {
              janitor = AgentStatus.critical;
            }
          } else if (action == 'analyst_phase') {
            if (outcome == 'success') {
              analyst = AgentStatus.healthy;
            } else if (outcome == 'critical_failure') {
              analyst = AgentStatus.critical;
            }
          } else if (action == 'observer_phase') {
            if (outcome == 'success') {
              observer = AgentStatus.healthy;
            } else if (outcome == 'critical_failure') {
              observer = AgentStatus.critical;
            }
          }
        } catch (_) {
          // Ignore malformed JSON lines
        }
      }

      // If we've recorded at least one timestamp, consider them healthy if not explicitly critical,
      // assuming a successful startup. But if we explicitly saw success, we mapped it above.

      return AgentHeartbeatState(
        janitorStatus: janitor,
        analystStatus: analyst,
        observerStatus: observer,
        lastUpdated: latestTime,
      );
    } catch (e) {
      return const AgentHeartbeatState();
    }
  }
}
