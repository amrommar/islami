import 'package:flutter/material.dart';

class Item_HadethDetails extends StatelessWidget {
  String content;

  Item_HadethDetails({required this.content});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$content',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
