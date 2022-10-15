import 'package:flutter/material.dart';
import 'package:nursey/app/utils/design/design.dart';

class AppBg extends StatelessWidget {
  const AppBg({required this.child, this.pattern, Key? key}) : super(key: key);
  final Widget child;
  final String? pattern;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pattern ?? AppBgPatterns.bgPattern2),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
