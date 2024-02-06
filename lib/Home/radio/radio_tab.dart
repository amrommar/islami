import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';

class Radio_Tab extends StatelessWidget {
  const Radio_Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            child: Text(
              'إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    color: My_Theme.primaryLightColor,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: My_Theme.primaryLightColor,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: My_Theme.primaryLightColor,
                    size: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
