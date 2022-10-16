import 'package:flutter/material.dart';
import 'package:nursey/app/utils/design/colors.dart';
import 'package:nursey/configs/configs.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton(
      {required this.title,
      this.onPressed,
      this.width,
      this.height,
      this.isBusy = false,
      Key? key})
      : super(key: key);
  final String title;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isBusy;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isBusy ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryAccent,
        foregroundColor: AppColors.primaryBg,
        disabledBackgroundColor: AppColors.primaryAccent.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: Size(width ?? double.infinity, height ?? 60),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: isBusy
            ? const SpinKitDoubleBounce(
                color: AppColors.primaryAccent,
                size: 100.0,
              )
            : Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton(
      {required this.title,
      this.onPressed,
      this.width,
      this.height,
      this.isBusy = false,
      this.color,
      Key? key})
      : super(key: key);
  final String title;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isBusy;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isBusy ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: color != null
            ? color!.withOpacity(0.1)
            : AppColors.primaryAccent.withOpacity(0.1),
        foregroundColor: color ?? AppColors.primaryAccent,
        disabledBackgroundColor: AppColors.primaryAccent.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: Size(width ?? double.infinity, height ?? 60),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: isBusy
            ? const SpinKitDoubleBounce(
                color: AppColors.primaryAccent,
                size: 100.0,
              )
            : Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}
