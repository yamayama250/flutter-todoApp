import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final pickDateProvider = StateProvider((ref) => DateTime.now());
final dateFormat = DateFormat("yyyy年MM月dd日");

Widget datePickerButton(DateTime deadline) {
  return Consumer(
    builder: (context, ref, child) {
      final pickDate = ref.watch(pickDateProvider);
      return TextButton(
        onPressed: () async {
          final DateTime? picked = await showDatePicker(
            locale: const Locale("ja"),
            context: context,
            initialDate: deadline,
            firstDate: DateTime(2021),
            lastDate: DateTime.now().add(const Duration(days: 360)),
          );
          if (picked != null) {
            ref.read(pickDateProvider.notifier).update((state) => picked);
          }
        },
        child: Text("期限：${dateFormat.format(pickDate)}"),
      );
    },
  );
}
