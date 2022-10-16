import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nursey/app/models/models.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/services/services.dart';
import 'package:nursey/app/services/task_service.dart';
import 'package:nursey/app/ui/widgets/app_bar.dart';
import 'package:nursey/app/ui/widgets/buttons.dart';
import 'package:nursey/app/utils/extensions/build_context_extension.dart';

import '../../../utils/design/design.dart';
import 'edit_task.dart';

class TaskDetail extends StatefulWidget {
  static Route route(Task task) => MaterialPageRoute(
        builder: (_) => TaskDetail(task),
      );
  const TaskDetail(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Task Detail'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.task,
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.task.note ?? '',
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
                          Text(widget.task.status.name,
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
                            color: (widget.task.severity.isMild)
                                ? AppColors.primaryInfo
                                : widget.task.severity.isImportant
                                    ? AppColors.primaryError
                                    : AppColors.primaryWarning,
                          ),
                          Text(widget.task.severity.name,
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
                          ShiftWidget(widget.task.shift),
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
                  ShiftWidget(widget.task.shift, isCompleting: true),
                ],
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSecondaryButton(
                    title: 'Edit',
                    onPressed: () => context.push(EditTask.route(widget.task)),
                  ),
                  const SizedBox(width: 16),
                  AppPrimaryButton(
                    width: 290,
                    title: widget.task.status.isCompleted
                        ? 'Done'
                        : 'Mark As Done',
                    onPressed: widget.task.status.isCompleted
                        ? null
                        : () {
                            //TODO Refactor to use bloc, and update state
                            TaskService().markTaskAsDone(widget.task);
                            context.pop();
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftWidget extends StatelessWidget {
  const ShiftWidget(this.shiftId, {this.isCompleting = false, Key? key})
      : super(key: key);
  final String shiftId;
  final bool isCompleting;
  @override
  Widget build(BuildContext context) {
    return //TODO: Refactor to use Bloc, streams, etc.
        FutureBuilder<Shift?>(
            future: ShiftService().getShiftFromId(shiftId),
            builder: (context, snapshot) {
              return Text(
                  isCompleting
                      ? '${snapshot.data?.name} Shift'
                      : snapshot.data?.name ?? '',
                  style: GoogleFonts.nunito(
                      fontSize: isCompleting ? 14 : 16,
                      color: isCompleting
                          ? AppColors.primaryError
                          : AppColors.primaryText));
            });
  }
}
