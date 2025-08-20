import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget(
      {super.key, required this.title, this.color = Colors.grey, this.secondaryColor, this.fontColor = Colors.black});

  const BoxWidget.transition(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      this.secondaryColor = Colors.white,
      this.fontColor = Colors.black});

  final String title;
  final Color? color;
  final Color? secondaryColor;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: secondaryColor != null
              ? LinearGradient(
                  colors: [color!, secondaryColor!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: secondaryColor == null ? color : null,
        ),
        width: screenWidth * 0.85,
        height: screenHeight * 0.09,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: fontColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
