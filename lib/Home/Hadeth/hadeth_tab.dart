import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/item_hadethname.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class Hadeth_Tab extends StatefulWidget {
  @override
  State<Hadeth_Tab> createState() => _Hadeth_TabState();
}

class _Hadeth_TabState extends State<Hadeth_Tab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    if (hadethList.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: provider.isDark()
              ? My_Theme.yellowColor
              : My_Theme.primaryLightColor,
          thickness: 3,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context)!.hadeth_Name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Divider(
          color: provider.isDark()
              ? My_Theme.yellowColor
              : My_Theme.primaryLightColor,
          thickness: 3,
        ),
        hadethList.isEmpty
            ? CircularProgressIndicator(
                color: provider.isDark()
                    ? My_Theme.yellowColor
                    : My_Theme.primaryLightColor,
              )
            : Expanded(
                child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: provider.isDark()
                        ? My_Theme.yellowColor
                        : My_Theme.primaryLightColor,
                    thickness: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return Item_HadethName(
                    hadeth: hadethList[index],
                  );
                },
                itemCount: hadethList.length,
              ))
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      hadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
