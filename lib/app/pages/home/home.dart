import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/home/widgets/home_content.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';

import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_bottom_navigator.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Home',
      ),
      body: Center(
        child: HomeContent(),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        initialIndexOfScreen: 0,
      ),
    );
  }
}
