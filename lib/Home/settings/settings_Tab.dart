import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/settings/language_bottom_sheet.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class settings_Tab extends StatefulWidget {
  @override
  State<settings_Tab> createState() => _settings_TabState();
}

class _settings_TabState extends State<settings_Tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 10),
            decoration: BoxDecoration(
                color: My_Theme.primaryLightColor,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.appLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: My_Theme.whiteColor),
                ),
                IconButton(
                    onPressed: () {
                      showBottomSheet();
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 40,
                      color: My_Theme.whiteColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return language_Bottom_Sheet();
          ;
        });
  }
}
