import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_bottom_navigator.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Overview',
      ),
      body: Center(
        child: const Text('Hello World this overview'),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        initialIndexOfScreen: 1,
      ),
    );
  }
}
