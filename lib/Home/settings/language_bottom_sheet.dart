import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class language_Bottom_Sheet extends StatefulWidget {
  @override
  State<language_Bottom_Sheet> createState() => _language_Bottom_SheetState();
}

class _language_Bottom_SheetState extends State<language_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.english, context)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.english, context)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic, context)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.arabic, context))
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: provider.isDark()
                    ? My_Theme.yellowColor
                    : My_Theme.whiteColor)),
        Icon(
          Icons.check,
          size: 40,
          color: provider.isDark() ? My_Theme.yellowColor : My_Theme.whiteColor,
        )
      ],
    );
  }

  Widget getUnselectedItemWidget(String text, context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: provider.isDark()
                    ? My_Theme.whiteColor
                    : My_Theme.blackColor,
              ),
        ),
      ],
    );
  }
}
