import 'package:flutter/material.dart';

import 'hadeth_Details_screen.dart';
import 'hadeth_tab.dart';

class Item_HadethName extends StatelessWidget {
  Hadeth hadeth;
  Item_HadethName({required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          HadethDetailsScreen.routeName,
          arguments: hadeth,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Text(
          hadeth.title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
