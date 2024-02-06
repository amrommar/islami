import 'package:flutter/material.dart';
import 'package:islami/Home/Home_screen.dart';
import 'package:islami/Home/quran/Sura_Details_screen.dart';
import 'package:islami/my_theme.dart';

import 'Home/Hadeth/hadeth_Details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      routes: {
        Home_Screen.routeName: (context) => Home_Screen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      theme: My_Theme.lightTheme,
    );
  }
}
