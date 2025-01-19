import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('EEE, MMM d, yyyy').format(date);
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
