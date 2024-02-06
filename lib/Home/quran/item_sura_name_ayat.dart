import 'package:flutter/material.dart';
import 'package:islami/Home/quran/Sura_Details_screen.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Item_SureName extends StatelessWidget {
  String name;
  String ayatNum;
  int index;

  Item_SureName(
      {required this.name, required this.ayatNum, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(index: index, name: name));
      },
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 2,
              color: provider.isDark()
                  ? My_Theme.yellowColor
                  : My_Theme.primaryLightColor,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Center(
                child: Text(
                  ayatNum,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
