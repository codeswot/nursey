import 'package:flutter/material.dart';
import 'package:nursey/app/utils/design/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.primaryBg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: AppColors.primaryAccent),
            SizedBox(height: 30),
            Text('Please Wait...'),
          ],
        ),
      ),
    );
  }
}
