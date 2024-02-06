import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class mode_Bottom_Sheet extends StatefulWidget {
  @override
  State<mode_Bottom_Sheet> createState() => _mode_Bottom_SheetState();
}

class _mode_Bottom_SheetState extends State<mode_Bottom_Sheet> {
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
                provider.changeMode(ThemeMode.light);
              },
              child: provider.isDark()
                  ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                  : getSelectedItemWidget(
                      AppLocalizations.of(context)!.light, context)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.dark, context)
                  : getUnselectedItemWidget(AppLocalizations.of(context)!.dark))
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

  Widget getUnselectedItemWidget(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
