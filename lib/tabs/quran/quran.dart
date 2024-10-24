import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  final List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  final List<int> suraVerseCounts = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    8,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    7,
    3,
    6
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        const SizedBox(height: 12),
        // Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'عدد الآيات',
                        style: TextStyle(
                          color: settingsProvider.isDark
                              ? AppTheme.gold
                              : AppTheme.lightPrimary,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'اسم السورة',
                        style: TextStyle(
                          color: settingsProvider.isDark
                              ? AppTheme.gold
                              : AppTheme.lightPrimary,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color:
              settingsProvider.isDark ? AppTheme.gold : AppTheme.lightPrimary,
          thickness: 5,
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suraNames.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Divider(
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                    thickness: 3,
                    height: 0,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      SuraContentScreen.routeName,
                      arguments: SuraContentArgs(
                        suraName: suraNames[index],
                        index: index,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                '${suraVerseCounts[index]}',
                                style: TextStyle(
                                  color: settingsProvider.isDark
                                      ? AppTheme.gold
                                      : AppTheme.lightPrimary,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black54,
                            thickness: 2,
                            width: 20,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                suraNames[index],
                                style: TextStyle(
                                  color: settingsProvider.isDark
                                      ? AppTheme.gold
                                      : AppTheme.lightPrimary,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                    thickness: 4,
                    height: 0,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SuraContentArgs {
  String suraName;
  int index;

  SuraContentArgs({required this.suraName, required this.index});
}
