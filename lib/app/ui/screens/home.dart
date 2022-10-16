import 'package:flutter/material.dart';
import 'package:nursey/app/bloc/bloc.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/ui/screens/task/create_task.dart';
import 'package:nursey/app/ui/widgets/widgets.dart';
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
          appBar: const CustomAppBar(isHome: true),
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
                    });
              }
              //return an error screen if error
              return const SizedBox();
            });
      },
    );
  }
}
