import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String message;

  const MessageDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, "Aceptar");
              },
              child: const Text("Aceptar"))
        ],
        title: Text(
          title,
        ),
        content: Text(
          message,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ));
  }
}
