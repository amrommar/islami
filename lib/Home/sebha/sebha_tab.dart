import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class sebha_Tab extends StatefulWidget {
  @override
  State<sebha_Tab> createState() => _sebha_TabState();
}

class _sebha_TabState extends State<sebha_Tab> {
  List<String> azkarList = [
    'سبحان الله',
    'الحمدلله',
    ' الله اكبر',
    'لا اله الا الله',
  ];
  int index = 0;
  double _rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.25,
                right: MediaQuery.of(context).size.width * 0.16,
                top: MediaQuery.of(context).size.height * 0.018,
              ),
              child: provider.isDark()
                  ? Image(
                      image: AssetImage('assets/images/head_sebha_dark.png'))
                  : Image(
                      image: AssetImage('assets/images/head_sebha_logo.png')),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.11,
                  left: MediaQuery.of(context).size.width * 0.01,
                  right: MediaQuery.of(context).size.width * 0.012,
                ),
                child: GestureDetector(
                  onTap: _rotateImage,
                  child: Transform.rotate(
                    angle: _rotationAngle,
                    child: provider.isDark()
                        ? Image.asset('assets/images/body_sebha_dark.png')
                        : Image.asset(
                            'assets/images/body_sebha_logo.png'), // Replace 'your_image.png' with the actual path to your image
                  ),
                ))
          ]),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.03),
              child: Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('$_tapCount',
                  style: Theme.of(context).textTheme.titleMedium)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(azkarList[index],
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  int _tapCount = 0;

  void _rotateImage() {
    setState(() {
      _tapCount++;
      _rotationAngle -= 25;
      if (_tapCount == 33) {
        _tapCount = 1;
        if (index < azkarList.length - 1) {
          index++;
        } else {
          index = 0; // Reset the tap count after 33 taps
        }
        _rotationAngle = 0; // Reset the rotation angle to 0
      }
    });
  }
}
