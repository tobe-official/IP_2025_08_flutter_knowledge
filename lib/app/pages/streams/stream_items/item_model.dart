import 'package:flutter/cupertino.dart';

class Item {
  final double id;
  final String title;
  final BoxShape shape;
  final Color backgroundColor;

  const Item({
    required this.id,
    required this.title,
    required this.shape,
    required this.backgroundColor,
  });
}
