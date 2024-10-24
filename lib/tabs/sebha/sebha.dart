import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = '/sebha';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int countTasbih = 0;
  int countTasbihRound = 0;
  int totalCountTasbih = 0;
  String tasbih = '';

  String changeTextTasbih() {
    switch (countTasbihRound) {
      case 1:
        tasbih = 'الحمدلله';
        break;
      case 2:
        tasbih = 'لا إله إلا الله';
        break;
      case 3:
        tasbih = 'الله أكبر';
      default:
        tasbih = 'سبحان الله';
    }
    return tasbih;
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/${Provider.of<SettingsProvider>(context).sebhaLogo}.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                'عدد التسبيحات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$countTasbih',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary, // Button background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  countTasbih++;
                  totalCountTasbih++;
                  if (countTasbih == 33) {
                    countTasbihRound++;
                    countTasbih = 0;
                    if (totalCountTasbih == 132) {
                      countTasbih = 0;
                      countTasbihRound = 0;
                      totalCountTasbih = 0;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Message'),
                            content: const Text('لقد اتممت التسبيح'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                  setState(() {});
                },
                child: Text(
                  changeTextTasbih(),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
