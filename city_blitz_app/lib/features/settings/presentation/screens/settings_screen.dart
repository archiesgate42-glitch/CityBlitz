import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/app_scaffold.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Settings',
      currentIndex: 2,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens_outlined),
              title: const Text('Theme'),
              subtitle: const Text('System default'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Implement theme switcher
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About CityBlitz'),
              subtitle: const Text('v0.1.0'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'CityBlitz',
                  applicationVersion: '0.1.0',
                  applicationLegalese: '© 2026 BioNairi',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
