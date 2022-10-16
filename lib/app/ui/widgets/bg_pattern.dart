import 'package:flutter/material.dart';
import 'package:nursey/app/utils/design/design.dart';
import 'package:nursey/configs/configs.dart';

class AppPattern extends StatelessWidget {
  const AppPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppBgPatterns.bgPattern2,
      alignment: Alignment.center,
      width: ScreenUtil.absoluteWidth,
      height: ScreenUtil.absoluteHeight,
      color: AppColors.primaryAccent.withOpacity(0.1),
    );
  }
}
