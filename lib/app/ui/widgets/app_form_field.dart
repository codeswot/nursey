import 'package:flutter/material.dart';
import 'package:nursey/app/models/residence/residence.dart';
import 'package:nursey/app/models/shift/shift.dart';
import 'package:nursey/app/services/shift_service.dart';
import 'package:nursey/app/utils/design/colors.dart';
import 'package:nursey/configs/packages.dart';

import '../../models/task/enums.dart';
import '../../services/residence_service.dart';

class AppFormField extends StatelessWidget {
  const AppFormField(
      {required this.controller,
      this.hint,
      this.label,
      this.maxLines,
      this.minLines,
      this.isPassword = false,
      this.obscure = true,
      this.onVisibilityChanged,
      Key? key})
      : super(key: key);
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final bool isPassword, obscure;
  final VoidCallback? onVisibilityChanged;
  final int? maxLines;
  final int? minLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryAccent.withOpacity(0.2),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? obscure : false,
        minLines: maxLines,
        maxLines: maxLines,
        style: GoogleFonts.nunito(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          label: label != null ? Text(label ?? '') : null,
          labelStyle: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          hintStyle: GoogleFonts.nunito(
            color: AppColors.secondaryText2,
          ),
          suffixIcon: isPassword
              ? InkWell(
                  onTap: onVisibilityChanged,
                  child: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryAccent,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class ShiftDropDown extends StatelessWidget {
  const ShiftDropDown({this.onChanged, required this.value, Key? key})
      : super(key: key);
  final String? value;
  final Function(Shift?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Shift>?>(
        future: ShiftService().getAllShifts(),
        builder: (context, snap) {
          final data = snap.data ?? [];
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryAccent.withOpacity(0.2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<Shift>(
                hint: const Text('Select Shift'),
                style: GoogleFonts.nunito(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                items: data
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          '${e.name} Shift' ?? '',
                          style: GoogleFonts.nunito(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          );
        });
  }
}

class ResidenceDropDownPicker extends StatelessWidget {
  const ResidenceDropDownPicker({this.onChanged, required this.value, Key? key})
      : super(key: key);
  final String? value;
  final Function(Residence?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Residence>?>(
        future: ResidenceService().getAllResidence(),
        builder: (context, snap) {
          final data = snap.data ?? [];
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryAccent.withOpacity(0.2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<Residence>(
                hint: const Text('Select Residence'),
                style: GoogleFonts.nunito(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                items: data
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name ?? '',
                          style: GoogleFonts.nunito(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          );
        });
  }
}

class StatusPicker extends StatelessWidget {
  const StatusPicker({required this.value, this.onChanged, Key? key})
      : super(key: key);
  final TaskStatus value;
  final Function(TaskStatus? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryAccent.withOpacity(0.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Status',
                  style: TextStyle(
                    color: AppColors.secondaryText2,
                    fontWeight: FontWeight.bold,
                  )),
              Text(value.name,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: TaskStatus.values
              .map((e) => Container(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: e == value
                                ? AppColors.primaryAccent
                                : AppColors.primaryAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                          onTap: () {
                            onChanged!(e);
                          },
                          child: Text(
                            e.name,
                            style: GoogleFonts.nunito(
                              color: e == value
                                  ? AppColors.primaryBg
                                  : AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class SeverityPicker extends StatelessWidget {
  const SeverityPicker({required this.value, this.onChanged, Key? key})
      : super(key: key);
  final TaskSeverity value;
  final Function(TaskSeverity? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryAccent.withOpacity(0.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Severity',
                  style: TextStyle(
                    color: AppColors.secondaryText2,
                    fontWeight: FontWeight.bold,
                  )),
              Text(value.name,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: TaskSeverity.values
              .map((e) => Container(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: e == value
                                ? AppColors.primaryAccent
                                : AppColors.primaryAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                          onTap: () {
                            onChanged!(e);
                          },
                          child: Text(
                            e.name,
                            style: GoogleFonts.nunito(
                              color: e == value
                                  ? AppColors.primaryBg
                                  : AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
