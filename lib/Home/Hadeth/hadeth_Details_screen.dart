import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/hadeth_tab.dart';
import 'package:islami/Home/Hadeth/item_hadeth_details.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'HadethDetailsScreen';

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.05),
          decoration: BoxDecoration(
              color: provider.isDark()
                  ? My_Theme.primaryDarkColor
                  : My_Theme.whiteColor,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Text(
                  '${args.title}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Divider(
                thickness: 2,
                color: provider.isDark()
                    ? My_Theme.yellowColor
                    : My_Theme.primaryLightColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Item_HadethDetails(content: args.content[index]);
                    },
                    itemCount: args.content.length,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
