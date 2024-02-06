import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/hadeth_tab.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/Home/radio/radio_tab.dart';
import 'package:islami/Home/sebha/sebha_tab.dart';
import 'package:islami/Home/settings/settings_Tab.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Stack(
      children: [
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              AppLocalizations.of(context)!.app_Title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.quran,
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeth,
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.sebha,
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    )),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.settings,
                    icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    Quran_Tab(),
    Hadeth_Tab(),
    sebha_Tab(),
    Radio_Tab(),
    settings_Tab(),
  ];
}
