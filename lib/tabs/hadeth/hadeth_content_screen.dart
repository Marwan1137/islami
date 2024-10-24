import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/class_hadeth.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routeName = '/hadeth_content';

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  List<String> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/${settingsProvider.backgroundImageName}.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.11,
              horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
          ),
          child: ListView.builder(
            itemBuilder: (_, index) => Text(
              hadeth.content[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            itemCount: hadeth.content.length,
          ),
        ),
      ),
    );
  }
}
