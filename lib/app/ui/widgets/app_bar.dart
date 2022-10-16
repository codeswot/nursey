import 'package:flutter/material.dart';
import 'package:nursey/app/ui/widgets/app_bg.dart';
import 'package:nursey/app/utils/extensions/build_context_extension.dart';
import 'package:nursey/configs/configs.dart';

import '../../utils/design/design.dart';

//TODO: Wrap with shiftBloc/nurseBloc and get shifts with current nurse
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.isHome = false, this.title, Key? key})
      : super(key: key);
  final bool isHome;
  final String? title;
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
          child: isHome
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                            const SizedBox(height: 5),
                            Text(
                              'Morning Shift',
                              style: GoogleFonts.nunito(
                                color: AppColors.primaryError,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '10 Tasks Pending',
                              style: GoogleFonts.nunito(
                                color: AppColors.secondaryText2,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        Spring.bubbleButton(
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor:
                                AppColors.primaryAccent.withOpacity(0.5),
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
                    const TaskFilterPicker(),
                  ],
                )
              : Row(
                  children: [
                    Spring.bubbleButton(
                      child: InkWell(
                        onTap: () => context.pop(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.secondaryText,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title ?? '',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryText,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 200);
}

class TaskFilterPicker extends StatefulWidget {
  const TaskFilterPicker({Key? key}) : super(key: key);

  @override
  State<TaskFilterPicker> createState() => _TaskFilterPickerState();
}

class _TaskFilterPickerState extends State<TaskFilterPicker> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spring.fadeIn(
          child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Text('Pending Tasks',
                  style: GoogleFonts.nunito(
                    fontWeight: _selectedIndex == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _selectedIndex == 0
                        ? AppColors.primaryAccent
                        : AppColors.secondaryText2,
                    fontSize: _selectedIndex == 0 ? 20 : 19,
                  ))),
        ),
        const SizedBox(width: 15),
        Spring.fadeIn(
          child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Text('Completed Tasks',
                  style: GoogleFonts.nunito(
                    color: _selectedIndex == 1
                        ? AppColors.primaryAccent
                        : AppColors.secondaryText2,
                    fontWeight: _selectedIndex == 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: _selectedIndex == 1 ? 20 : 19,
                  ))),
        ),
      ],
    );
  }
}
