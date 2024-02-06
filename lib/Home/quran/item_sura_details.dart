import 'package:flutter/material.dart';

class Item_SureDetails extends StatelessWidget {
  String name;
  int index;
  Item_SureDetails({required this.name, required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$name {${index + 1}}',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
