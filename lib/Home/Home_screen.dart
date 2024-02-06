import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeth/hadeth_tab.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/Home/radio/radio_tab.dart';
import 'package:islami/Home/sebha/sebha_tab.dart';
import 'package:islami/my_theme.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
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
              'Islami',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: My_Theme.primaryLightColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Quran',
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Hadeth',
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Sebha',
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'Radio',
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    )),
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
  ];
}
