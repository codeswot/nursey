import 'package:flutter/material.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/utils/design/design.dart';

import '../../widgets/widgets.dart';

class EditTask extends StatefulWidget {
  static Route route(Task task) => MaterialPageRoute(
        builder: (_) => EditTask(task),
      );
  const EditTask(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  TaskStatus? _status;
  TaskSeverity? _severity;
  @override
  Widget build(BuildContext context) {
    _taskController.text = widget.task.task;
    _noteController.text = widget.task.note ?? '';

    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Task'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormField(controller: _taskController, label: 'Task'),
                  const SizedBox(height: 16),
                  AppFormField(controller: _noteController, label: 'Note'),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.secondaryAccent, thickness: 1),
                  const SizedBox(height: 16),
                  StatusPicker(
                    value: _status ?? widget.task.status,
                    onChanged: (newStatus) {
                      setState(() {
                        _status = newStatus;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  SeverityPicker(
                    value: _severity ?? widget.task.severity,
                    onChanged: (newSeverity) {
                      setState(() {
                        _severity = newSeverity;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 100),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppSecondaryButton(
                      title: 'Delete',
                      onPressed: () {},
                      color: AppColors.primaryError,
                    ),
                    AppPrimaryButton(
                      width: ScreenUtil.screenWidth - 150,
                      title: 'Save',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
