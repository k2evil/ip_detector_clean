import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/statuses/status.dart';
import 'package:untitled/features/ip_detector/presentation/providers/ip_provider.dart';
import 'package:untitled/features/settings/presentation/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IpScreen extends StatelessWidget {
  const IpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          Consumer<SettingsProvider>(
            builder: (_, settings, __) => IconButton(
              onPressed: () => settings.switchDarkMode(),
              icon:
                  Icon(settings.darkMode ? Icons.light_mode : Icons.dark_mode),
            ),
          ),
          Consumer<SettingsProvider>(
            builder: (_, settings, __) => IconButton(
              onPressed: () => settings.switchLocale(),
              icon: Text(settings.locale.languageCode == "en" ? "FA" : "EN"),
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<IpProvider>(
          builder: (context, provider, child) {
            switch (provider.status) {
              case ScreenStatus.loading:
              case ScreenStatus.uninitialized:
                return const CircularProgressIndicator();
              case ScreenStatus.error:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.close),
                    const SizedBox(height: 26),
                    Text(AppLocalizations.of(context)!.error),
                  ],
                );
              case ScreenStatus.success:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context)!.yourIp),
                    const SizedBox(height: 26),
                    Text(provider.ipInfo!.ip),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
