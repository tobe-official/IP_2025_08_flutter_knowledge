import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/canvas/widgets/my_painter.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/canvas/model/stroke.dart';

import 'color_picker.dart';

class DrawingPad extends StatefulWidget {
  const DrawingPad({
    super.key,
    required this.width,
    required this.height,
    this.strokeWidth = 4.0,
    this.borderRadius = 12.0,
  });

  final double width;
  final double height;
  final double strokeWidth;
  final double borderRadius;

  @override
  State<DrawingPad> createState() => _DrawingPadState();
}

class _DrawingPadState extends State<DrawingPad> {
  final List<Stroke> _strokes = [];
  Stroke? _current;
  Color strokeColor = Colors.white;

  Paint _basePaint() => Paint()
    ..color = strokeColor
    ..strokeWidth = widget.strokeWidth
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true;

  void _start(Offset p) {
    _current = Stroke(points: [p], paint: _basePaint());
    _strokes.add(_current!);
    setState(() {});
  }

  void _update(Offset p) {
    if (_current == null) return;
    _current!.points.add(p);
    setState(() {});
  }

  void _end() {
    _current = null;
  }

  void _changeColor(Color color) {
    strokeColor = color;
    setState(() {});
  }

  void _undo() {
    if (_strokes.isNotEmpty) {
      _strokes.removeLast();
      setState(() {});
    }
  }

  void _clear() {
    _strokes.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Stack(
          children: [
            _controls(context),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              final picked = await showDialog<Color>(
                context: context,
                builder: (_) => ColorPickerDialog(initial: strokeColor),
              );
              _changeColor(picked ?? strokeColor);
            },
            icon: Icon(Icons.color_lens_outlined),
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _undo,
            icon: Icon(Icons.undo),
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _clear,
            icon: Icon(Icons.delete_outline),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _controls(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.black,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (current) => _start(current.localPosition),
        onPanUpdate: (current) => _update(current.localPosition),
        onPanEnd: (_) => _end(),
        child: CustomPaint(
          painter: MyPainter(_strokes),
          willChange: true,
        ),
      ),
    );
  }
}
