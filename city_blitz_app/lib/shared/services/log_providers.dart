import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'log_repository.dart';

/// Provides the singleton [LogRepository].
final logRepositoryProvider = Provider<LogRepository>((ref) {
  return LogRepository();
});

/// A StreamProvider that polls the agent log file every 2 seconds.
final agentHeartbeatStreamProvider = StreamProvider.autoDispose<AgentHeartbeatState>((ref) async* {
  final repo = ref.watch(logRepositoryProvider);
  bool isDisposed = false;
  ref.onDispose(() => isDisposed = true);
  
  // Yield immediately
  yield await repo.getLatestHeartbeat();
  
  // Then poll every 2 seconds
  while (!isDisposed) {
    await Future.delayed(const Duration(seconds: 2));
    if (isDisposed) break;
    yield await repo.getLatestHeartbeat();
  }
});
