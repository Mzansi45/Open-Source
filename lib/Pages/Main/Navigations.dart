import 'package:flutter/material.dart';

class NavigationHelper extends StatefulWidget {
  final Widget child;
  const NavigationHelper({super.key, required this.child});

  @override
  State<NavigationHelper> createState() => _NavigationHelperState();
}

class _NavigationHelperState extends State<NavigationHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: widget.child,
        )
      ),
    );
  }
}
