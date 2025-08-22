import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ip_2025_08_flutter_knowledge/app/pages/overview/widgets/box.dart';
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
      //TODO add a search field for better searching
      //TODO use a stream with data and delays for new data to give sometimes "random" boxes to the ui + the real boxes. random boxes lead to a prank screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxWidget(
              title: 'Constructor',
              routerPath: '/global',
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            BoxWidget.transition(
              title: 'Named Constructors',
              routerPath: '/global',
              color: Colors.blue,
              secondaryColor: Colors.green,
              fontColor: Colors.white,
            ),
            SizedBox(height: 30),
            BoxWidget(
              title: 'Canvas',
              routerPath: '/canvas',
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        initialIndexOfScreen: 1,
      ),
    );
  }
}
