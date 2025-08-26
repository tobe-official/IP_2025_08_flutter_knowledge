import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/streams/stream_items/item_model.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: item.backgroundColor,
        shape: item.shape,
        borderRadius: item.shape == BoxShape.rectangle ? BorderRadius.circular(16) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
