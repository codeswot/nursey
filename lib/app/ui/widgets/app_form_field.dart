import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nursey/app/models/residence/residence.dart';
import 'package:nursey/app/models/shift/shift.dart';
import 'package:nursey/app/services/shift_service.dart';
import 'package:nursey/app/utils/design/colors.dart';

import '../../models/task/enums.dart';
import '../../services/residence_service.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({required this.controller, this.hint, Key? key})
      : super(key: key);
  final TextEditingController controller;
  final String? hint;
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
        style: GoogleFonts.nunito(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: GoogleFonts.nunito(
            color: AppColors.secondaryText,
          ),
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

class SeverityPicker extends StatelessWidget {
  const SeverityPicker({required this.value, this.onChanged, Key? key})
      : super(key: key);
  final TaskSeverity? value;
  final Function(TaskSeverity? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryAccent.withOpacity(0.2),
          ),
          child: Text(value?.name ?? ''),
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