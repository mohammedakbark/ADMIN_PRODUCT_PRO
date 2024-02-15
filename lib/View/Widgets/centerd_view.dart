import 'package:flutter/material.dart';

class CenterdView extends StatelessWidget {
  final Widget child;
  const CenterdView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      // alignment: Alignment.topCenter,
      child: child,
    );
  }
}
