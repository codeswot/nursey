import 'package:flutter/material.dart';
import 'package:nursey/app/models/task/enums.dart';
import 'package:nursey/app/models/task/task.dart';
import 'package:nursey/configs/packages.dart';

import '../../utils/design/design.dart';

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
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (task.severity.isMild)
                    ? AppColors.primaryBg
                    : task.severity.isImportant
                        ? AppColors.primaryError
                        : AppColors.primaryWarning,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
