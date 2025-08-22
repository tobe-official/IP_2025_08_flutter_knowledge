import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.arrowBack = false,
  });

  final String title;
  final bool? arrowBack;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.arrowBack!
          ? IconButton(
              onPressed: () => _routeBack(context),
              icon: Icon(Icons.arrow_back_ios_new),
            )
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
    );
  }

  _routeBack(BuildContext context) {
    final router = context.router;
    router.pop();
  }
}
