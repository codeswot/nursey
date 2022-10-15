import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/bloc.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/ui/screens/task/create_task.dart';
import 'package:nursey/app/ui/widgets/app_bar.dart';
import 'package:nursey/app/ui/widgets/app_bg.dart';
import 'package:nursey/app/utils/design/colors.dart';
import 'package:nursey/app/utils/extensions/extensions.dart';
import 'package:nursey/configs/configs.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NurseBloc, NurseState>(
      listener: (context, state) {
        switch (state.status) {
          case NurseStatus.initial:
            // TODO: Handle this case.
            break;
          case NurseStatus.success:
            context
                .read<TaskBloc>()
                .add(GetTasks(shiftId: state.nurse?.shift ?? ''));
            break;
          case NurseStatus.error:
            // TODO: Handle this case.
            break;

          case NurseStatus.loading:
            // TODO: Handle this case.
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: const AppBg(child: TasksViewer()),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push(CreateTask.route()),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

//get tasks by shifts
class TasksViewer extends StatelessWidget {
  const TasksViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return StreamBuilder<List<Task>?>(
            stream: state.tasks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                final tasks = snapshot.data;
                return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: tasks?.length,
                    itemBuilder: (context, index) {
                      final listItem = tasks?[index];
                      return TaskTile(listItem!);

                      ListTile(
                        title: Text(listItem?.task ?? ''),
                        subtitle: Text(listItem?.shift ?? ''),
                        onTap: () {},
                      );
                    });
              }
              //return an error screen if error
              return const SizedBox();
            });
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      // height: 60,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: Text(
                    task.task,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: Text('- ${task.note}',
                      style: GoogleFonts.nunito(
                        color: AppColors.primaryText2,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            Container(
              width: 9.5,
              height: 9.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (task.severity.isMild)
                    ? AppColors.primaryBg
                    : task.severity.isImportant
                        ? AppColors.primaryError
                        : AppColors.secondaryAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
