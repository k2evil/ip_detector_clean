import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/ip_detector/presentation/pages/ip_screen.dart';
import 'package:untitled/features/ip_detector/presentation/providers/ip_provider.dart';
import 'package:untitled/features/settings/presentation/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'di.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => di.sl(),
      child: Consumer<SettingsProvider>(
        builder: (_, settings, __) => MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,

          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('fa', ''),
          ],
          locale: settings.locale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,
          home: ChangeNotifierProvider<IpProvider>(
            create: (_) => di.sl()..checkIp(),
            child: const IpScreen(),
          ),
        ),
      ),
    );
  }
}
