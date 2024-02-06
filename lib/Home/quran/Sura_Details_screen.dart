import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/quran/item_sura_details.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.isDark()
          ? Image.asset(
              'assets/images/main_background_dark.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/main_background.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context)!.app_Title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.06),
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? My_Theme.primaryDarkColor
                  : My_Theme.whiteColor,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Text(
                '${args.name}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Divider(
                thickness: 2,
                color: provider.isDark()
                    ? My_Theme.yellowColor
                    : My_Theme.primaryLightColor,
              ),
              verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1,
                              color: provider.isDark()
                                  ? My_Theme.yellowColor
                                  : My_Theme.primaryLightColor,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Item_SureDetails(
                              name: verses[index],
                              index: index,
                            );
                          },
                          itemCount: verses.length,
                        ),
                      ),
                    )
            ],
          ),
        ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\r\n');
    verses = lines;
    setState(() {});
    // for (int i = 0; i < lines.length; i++) {
    //   print(lines[i]);
    // }
  }
}
