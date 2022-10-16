import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/task/task_bloc.dart';
import 'package:nursey/app/models/residence/residence.dart';
import 'package:nursey/app/models/shift/shift.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/ui/widgets/app_form_field.dart';
import 'package:nursey/app/utils/extensions/extensions.dart';
import 'package:nursey/configs/configs.dart';

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
  Task? newTask;

  Shift? shift;
  Residence? residence;

  TaskSeverity? severity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Task'),
        actions: [
          IconButton(
            onPressed: () {
              newTask = Task(
                task: _taskController.text,
                shift: shift?.id ?? '',
                residence: residence?.id ?? '',
                note: _noteController.text,
              );

              context
                  .read<TaskBloc>()
                  .add(AddTask(task: newTask ?? Task.empty));
              context.pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AppFormField(
                controller: _taskController,
                hint: 'Task',
              ),
              const SizedBox(height: 15),
              AppFormField(
                controller: _noteController,
                hint: 'Note',
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              ShiftDropDown(
                value: shift?.name,
                onChanged: (val) {
                  setState(() {
                    shift = val;
                  });
                  newTask?.copyWith(shift: shift?.id);
                },
              ),
              const SizedBox(height: 15),
              ResidenceDropDownPicker(
                value: residence?.name,
                onChanged: (val) {
                  setState(() {
                    residence = val;
                  });
                  newTask?.copyWith(residence: residence?.id);
                },
              ),
              const SizedBox(height: 15),
              SeverityPicker(
                onChanged: (val) {
                  setState(() {
                    severity = val;
                  });
                  newTask?.copyWith(severity: severity);
                },
                value: severity!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
