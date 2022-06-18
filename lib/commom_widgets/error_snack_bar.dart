import 'package:flutter/material.dart';

void errorSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.error,
            color: Colors.white,
          ),
        ),
        Text(text),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
