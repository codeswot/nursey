import 'package:flutter/material.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/app/ui/screens/task/task_detail.dart';
import 'package:nursey/app/utils/extensions/extensions.dart';
import 'package:nursey/configs/packages.dart';

import '../../utils/design/design.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      // height: 60,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => context.push(TaskDetail.route(task)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
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
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<int>(
                  tooltip: 'Task Options',
                  icon: const Icon(
                    Icons.more_horiz,
                    color: AppColors.white,
                    size: 27,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      // row has two child icon and text
                      child: Row(
                        children: const [
                          Icon(Icons.check),
                          SizedBox(width: 10),
                          Text("Mark as done")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.edit),
                          SizedBox(width: 10),
                          Text("Edit")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      // row has two child icon and text
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Delete")
                        ],
                      ),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  offset: const Offset(20, 20),
                  color: AppColors.primaryBg,
                  elevation: 2,
                  onSelected: (int index) {
                    switch (index) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (task.severity.isMild)
                        ? AppColors.primaryInfo
                        : task.severity.isImportant
                            ? AppColors.primaryError
                            : AppColors.primaryWarning,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
