import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
// import 'package:audioplayers/audioplayers.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura_content';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];
  late SuraContentArgs args;
  // final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false;
  String audioPath = '';

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/${settingsProvider.backgroundImageName}.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.11,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
          ),
          child: Column(
            children: [
              ayat.isEmpty
                  ? const LoadingIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) => Text(
                          ayat[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        itemCount: ayat.length,
                      ),
                    ),
              const SizedBox(height: 16),
              isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          color: settingsProvider.isDark
                              ? AppTheme.gold
                              : AppTheme.lightPrimary,
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                          iconSize: 48,
                          onPressed: () {
                            // isPlaying ? pauseAudio() : playAudio();
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(const Duration(seconds: 2));
    String sura =
        await rootBundle.loadString('assets/ayat/${args.index + 1}.txt');
    ayat = sura.split('/r/n');
    audioPath = 'audio/${args.index + 1}.mp3';
    setState(() {});
  }

  // Future<void> playAudio() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     await _audioPlayer.play(AssetSource(audioPath));
  //     setState(() {
  //       isPlaying = true;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print('Error loading audio: $e');
  //   }
  // }

  // Future<void> pauseAudio() async {
  //   await _audioPlayer.pause();
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }
}
