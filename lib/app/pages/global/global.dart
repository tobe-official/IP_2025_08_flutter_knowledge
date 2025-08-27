import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';

@RoutePage()
class GlobalPage extends StatelessWidget {
  const GlobalPage({
    super.key,
    @PathParam('title') required this.title,
    @PathParam('description') required this.description,
    @PathParam('isNamedConstructor') this.isNamedConstructor = false,
  });

  final String title;
  final String description;
  final bool isNamedConstructor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: title,
        arrowBack: true,
      ),
      body: Center(
        child: SizedBox(height: screenHeight * 0.6, width: screenWidth * 0.8, child: _column()),
      ),
    );
  }

  Widget _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This contains named constructors: $isNamedConstructor',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 200),
      ],
    );
  }
}
