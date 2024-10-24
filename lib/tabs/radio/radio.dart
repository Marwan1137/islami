import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = '/radio';

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/radio_tab_logo.png',
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'إذاعة القرأن الكريم',
            style: TextStyle(
              fontSize: 26,
              color: settingsProvider.isDark
                  ? AppTheme.gold
                  : AppTheme.lightPrimary,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous),
                iconSize: 30,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                iconSize: 60,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next),
                iconSize: 30,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
