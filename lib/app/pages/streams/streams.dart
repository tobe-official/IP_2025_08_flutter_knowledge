import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/streams/stream_items/data.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/streams/stream_items/item_model.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/streams/widget/item_box.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';

@RoutePage()
class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final List<Item> _items = [];
  StreamSubscription<Item>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = timedItems(const Duration(seconds: 1)).listen(
      (value) {
        if (!mounted) return;
        setState(() => _items.add(value));
      },
      onError: (e, st) => debugPrint('stream error: $e'),
      onDone: () => debugPrint('Stream is done'),
      cancelOnError: false,
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Streams',
        arrowBack: true,
      ),
      body: _items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: _stream(),
            ),
    );
  }

  Widget _stream() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Items erscheinen im Sekundentakt',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            itemCount: _items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) => ItemBox(item: _items[i]),
          ),
        ),
      ],
    );
  }
}
