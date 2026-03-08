import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/consensus/consensus_notifier.dart';
import '../../../../core/consensus/consensus_state.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/services/inference_providers.dart';
import '../widgets/bright_data_badge.dart';
import '../widgets/consensus_hud.dart';
import '../widgets/satellite_sweep.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  bool _sweepComplete = false;

  @override
  void initState() {
    super.initState();
    // Satellite sweep auto-completes after the animation
    Future.delayed(const Duration(milliseconds: 3200), () {
      if (mounted) setState(() => _sweepComplete = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final consensusAsync = ref.watch(consensusProvider);
    final hotspotAsync = ref.watch(hotspotAnalysisProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF0A0E1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.radar, color: Colors.cyanAccent.withValues(alpha: 0.9), size: 20),
              const SizedBox(width: 8),
              Text(
                'CITYBLITZ — RED-ZONE MAP',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ── 1. Dark-Mode Map ──
          _buildDarkMap(),

          // ── 2. Satellite Sweep Overlay ──
          if (!_sweepComplete) const SatelliteSweep(),

          // ── 3. HUD Elements ──
          if (_sweepComplete) ...[
            // Top-left: Bright Data Badge
            Positioned(
              top: MediaQuery.of(context).padding.top + 56,
              left: 16,
              child: FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: const BrightDataBadge(),
              ),
            ),

            // Bottom: Consensus HUD
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideInUp(
                duration: const Duration(milliseconds: 700),
                child: ConsensusHud(
                  consensusAsync: consensusAsync,
                ),
              ),
            ),

            // Map markers for hotspots
            ...(_buildHotspotMarkerOverlay(hotspotAsync)),
          ],

          // ── 4. Scan indicator (top-right) ──
          if (_sweepComplete)
            Positioned(
              top: MediaQuery.of(context).padding.top + 56,
              right: 16,
              child: FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: _buildScanIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDarkMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: LatLng(
          AppConstants.defaultLatitude,
          AppConstants.defaultLongitude,
        ),
        initialZoom: AppConstants.defaultZoom,
        maxZoom: 18,
        minZoom: 4,
        backgroundColor: const Color(0xFF0A0E1A),
      ),
      children: [
        TileLayer(
          // CartoDB Dark Matter – beautiful dark tiles, no API key needed
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}@2x.png',
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'dev.cityblitz.app',
          maxZoom: 19,
          tileBuilder: (context, tileWidget, tile) {
            return ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.85, 0, 0, 0, 0, //
                0, 0.85, 0, 0, 0, //
                0, 0, 1.1, 0, 0, //
                0, 0, 0, 1, 0, //
              ]),
              child: tileWidget,
            );
          },
        ),
      ],
    );
  }

  Widget _buildScanIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.cyanAccent.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withValues(alpha: 0.5),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'LIVE SCAN',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.greenAccent.withValues(alpha: 0.9),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHotspotMarkerOverlay(AsyncValue hotspotAsync) {
    return hotspotAsync.when(
      data: (analysis) {
        return analysis.hotspots.asMap().entries.map<Widget>((entry) {
          final index = entry.key;
          // Spread hotspots around Montgomery
          final lat = AppConstants.defaultLatitude +
              (index * 0.015) - 0.02;
          final lng = AppConstants.defaultLongitude +
              (index * 0.012) - 0.015;

          return Positioned(
            top: MediaQuery.of(context).padding.top + 100 + (index * 40.0),
            right: 16,
            child: FadeIn(
              delay: Duration(milliseconds: (200 * index).toInt()),
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: entry.value.frictionScore >= 0.9
                      ? Colors.red.withValues(alpha: 0.2)
                      : Colors.orange.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: entry.value.frictionScore >= 0.9
                        ? Colors.redAccent.withValues(alpha: 0.5)
                        : Colors.orangeAccent.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 12,
                      color: entry.value.frictionScore >= 0.9
                          ? Colors.redAccent
                          : Colors.orangeAccent,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${entry.value.zipCode.length > 18 ? '${entry.value.zipCode.substring(0, 18)}…' : entry.value.zipCode}  ▸ ${(entry.value.frictionScore * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      },
      loading: () => [],
      error: (_, __) => [
        Positioned(
          top: MediaQuery.of(context).padding.top + 100,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border.all(color: Colors.redAccent.withValues(alpha: 0.5)),
            ),
            child: const Text(
              '[ DATA_LINK_FAILURE ]',
              style: TextStyle(
                fontFamily: 'monospace',
                color: Colors.redAccent,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
