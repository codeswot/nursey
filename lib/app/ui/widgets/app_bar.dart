import 'package:flutter/material.dart';
import 'package:nursey/app/ui/widgets/app_bg.dart';
import 'package:nursey/configs/configs.dart';

import '../../utils/design/design.dart';

//TODO: Wrap with shiftBloc/nurseBloc and get shifts with current nurse
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBg(
      pattern: AppBgPatterns.bgPattern1,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryAccent.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Mr Musa 👋',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryText,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Morning Shift',
                    style: GoogleFonts.nunito(
                      color: AppColors.primaryError,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '10 Tasks Pending',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryAccent,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              Spring.bubbleButton(
                child: CircleAvatar(
                  radius: 37,
                  backgroundColor: AppColors.primaryAccent.withOpacity(0.5),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.secondaryAccent,
                    backgroundImage: NetworkImage(
                        'https://www.shareicon.net/data/128x128/2016/07/05/791390_people_512x512.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 120);
}
