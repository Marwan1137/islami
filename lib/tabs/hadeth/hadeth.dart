import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/class_hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();

    return Column(
      children: [
        Image.asset(
          'assets/images/hadith_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? LoadingIndicator()
              : ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        HadethContentScreen.routeName,
                        arguments: ahadeth[index]),
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/ayat/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadehtLines = hadethString.trim().split('\n');
      String title = hadehtLines.first;
      hadehtLines.removeAt(0);
      List<String> content = hadehtLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
