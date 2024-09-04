import 'package:flutter/material.dart';
import 'package:dy/model/sdui_page.dart';

void showPrompt(BuildContext context, SduiComponent prompt) {
  if (prompt.type == 'Dialog' && prompt.attributes['type'] == 'confirm') {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(prompt.attributes['title'] ?? ''),
        content: Text(prompt.attributes['message'] ?? ''),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(), // Close dialog on Cancel
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog on Confirm
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
