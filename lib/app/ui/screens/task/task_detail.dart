import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/ui/widgets/app_bar.dart';
import 'package:nursey/app/ui/widgets/buttons.dart';

import '../../../utils/design/design.dart';

class TaskDetail extends StatelessWidget {
  static Route route(Task task) => MaterialPageRoute(
        builder: (_) => TaskDetail(task),
      );
  const TaskDetail(this.task, {Key? key}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Task Detail'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: ScreenUtil.screenHeight - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.task,
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      task.note ?? '',
                      style: GoogleFonts.nunito(fontSize: 16),
                    ),
                    const SizedBox(height: 26),
                    Text('Information',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //TODO: Refactor as separate widget (TaskInfo) an item in a list
                        Column(
                          children: [
                            Text('Status',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.pending_actions_outlined,
                              color: AppColors.primaryAccent,
                            ),
                            Text('Pending',
                                style: GoogleFonts.nunito(fontSize: 16)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Priority',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.priority_high_rounded,
                              color: (task.severity.isMild)
                                  ? AppColors.primaryInfo
                                  : task.severity.isImportant
                                      ? AppColors.primaryError
                                      : AppColors.primaryWarning,
                            ),
                            Text(task.severity.name,
                                style: GoogleFonts.nunito(fontSize: 16)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Shift',
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.timer_outlined,
                              color: AppColors.secondaryText,
                            ),
                            Text('Morning',
                                style: GoogleFonts.nunito(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),

                    //residence
                    Text('Residence',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoumy5SHln8GEbVkxguE1hinZJbP10HX6CRoD7wljernAyQq71ZXXphdv8d9VIhaQlmoI&usqp=CAU'),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Mr John Doe',
                      //task.residence ?? '',
                      style: GoogleFonts.nunito(fontSize: 16),
                    ),
                    const SizedBox(height: 26),
                    Text('Created By',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Mr Simon Carl',
                        style: GoogleFonts.nunito(fontSize: 16)),
                    Text('Evening Shift',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: AppColors.primaryError,
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSecondaryButton(title: 'Edit', onPressed: () {}),
                  const SizedBox(width: 16),
                  AppPrimaryButton(
                    width: 290,
                    title: 'Mark As Done',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
