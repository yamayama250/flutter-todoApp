import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget deadlineText(DateTime deadline) {
  final dateFormat = DateFormat("yyyy年MM月dd日");
  final now = DateTime.now();

  if (deadline.difference(now).inDays == 0) {
    return const Text(
      "期限：今日！！",
      style: TextStyle(color: Colors.red),
    );
  } else {
    if (deadline.isBefore(now)) {
      return Text(
        "期限：${dateFormat.format(deadline)}",
        style: const TextStyle(color: Colors.grey),
      );
    } else {
      return Text(
        "期限：${dateFormat.format(deadline)}",
        style: const TextStyle(color: Colors.black87),
      );
    }
  }
}
