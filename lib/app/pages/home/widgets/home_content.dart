import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hey, how\'s your day going?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 90,
          ),
          Text(
            'This app is here to show the achievements I did in the IP_2025_08 Sprint',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'When you go to the overview screen you can choose out of many options what you want to look add. Go have a look and have fun.',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
