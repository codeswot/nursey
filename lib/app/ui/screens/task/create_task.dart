import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/bloc.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/utils/design/design.dart';
import 'package:nursey/app/utils/extensions/extensions.dart';
import 'package:nursey/configs/packages.dart';

import '../../../models/task/task.dart';
import '../../widgets/widgets.dart';

class CreateTask extends StatefulWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const CreateTask(),
      );
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  TaskStatus? _status;
  TaskSeverity? _severity;
  late String _residence;
  late String _shift;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Create Task'),
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
                    value: _status ?? TaskStatus.pending,
                    onChanged: (newStatus) {
                      setState(() {
                        _status = newStatus;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  SeverityPicker(
                    value: _severity ?? TaskSeverity.mild,
                    onChanged: (newSeverity) {
                      setState(() {
                        _severity = newSeverity;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.secondaryAccent, thickness: 1),
                  const SizedBox(height: 16),
                  Text('Assign To , Shift',
                      style: GoogleFonts.nunito(fontSize: 16)),
                  const SizedBox(height: 6),
                  ShiftDropDown(
                    value: '',
                    onChanged: (newShift) {
                      _shift = newShift?.id ?? '';
                    },
                  ),
                  const SizedBox(height: 16),
                  Text('Assign To , Residence',
                      style: GoogleFonts.nunito(fontSize: 16)),
                  ResidenceDropDownPicker(
                    value: '',
                    onChanged: (newResidence) {
                      _residence = newResidence?.id ?? '';
                    },
                  ),
                ],
              ),
              const SizedBox(height: 100),
              SafeArea(
                child: AppPrimaryButton(
                  width: ScreenUtil.screenWidth,
                  title: 'Save',
                  onPressed: () {
                    //TODO: use form validator to validate the form
                    //TODO: Refactor, code clean up
                    final newTask = Task(
                      task: _taskController.text,
                      note: _noteController.text,
                      status: _status ?? TaskStatus.pending,
                      severity: _severity ?? TaskSeverity.mild,
                      shift: _shift,
                      residence: _residence,
                    );
                    context.read<TaskBloc>().add(SetTask(task: newTask));
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
