import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/canvas/widgets/drawing_pad.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';

@RoutePage()
class CanvasPage extends StatelessWidget {
  const CanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Canvas', arrowBack: true),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text('Let your creativity free and draw!', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            DrawingPad(
              width: size.width * 0.9,
              height: size.height * 0.75,
              strokeWidth: 4,
              borderRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
