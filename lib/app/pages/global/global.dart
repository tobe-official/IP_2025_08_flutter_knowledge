import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/widgets/custom_app_bar.dart';

@RoutePage()
class GlobalPage extends StatelessWidget {
  const GlobalPage({super.key});

  //Todo add the parameters like title for appBar and the content explaining what happens behind the ui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'GlobalPage',
        arrowBack: true,
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
