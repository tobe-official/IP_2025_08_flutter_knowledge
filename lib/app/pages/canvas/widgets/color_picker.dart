import 'package:flutter/material.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({super.key, required this.initial});

  final Color initial;

  static const palette = <Color>[
    Colors.white,
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.brown,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return dialog(context);
  }

  Widget dialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Choose color'),
      content: SizedBox(width: screenWidth * 0.9, child: colorGrid(context)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget colorGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [for (final color in palette) colorGestureDetector(context, color)],
    );
  }

  Widget colorGestureDetector(BuildContext context, Color color) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(color),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: Colors.black26,
            width: color == initial ? 3 : 1,
          ),
        ),
      ),
    );
  }
}
