import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({super.key, required this.initialIndexOfScreen});

  final int initialIndexOfScreen;

  @override
  State<CustomBottomNavigator> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomBottomNavigator> {
  late int _currentIndex;
  bool isHome = false;
  bool isOverview = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndexOfScreen;
    isHome = _currentIndex == 0;
    isOverview = _currentIndex == 1;
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return; // no-op if already on this tab

    setState(() {
      _currentIndex = index;
      isHome = index == 0;
      isOverview = index == 1;
    });

    final router = context.router;

    switch (index) {
      case 0:
        router.replacePath('/home');
        break;
      case 1:
        router.replacePath('/overview');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 35),
      unselectedIconTheme: const IconThemeData(size: 35),
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            isHome ? Icons.home : Icons.home_outlined,
            color: Colors.black,
          ),
          label: "Home Page",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            isOverview ? Icons.search : Icons.search_outlined,
            color: Colors.black,
          ),
          label: "Overview Page",
        ),
      ],
    );
  }
}
