import 'package:flutter/material.dart';
import 'package:nursey/app/utils/design/colors.dart';

class AppIllustration extends StatelessWidget {
  const AppIllustration(this.illustration, {Key? key}) : super(key: key);
  final String illustration;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, bottom: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(illustration),
    );
  }
}
