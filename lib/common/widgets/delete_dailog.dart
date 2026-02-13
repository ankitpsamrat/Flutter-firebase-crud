import 'package:flutter/material.dart';

class DeleteDailog extends StatelessWidget {
  final VoidCallback deleteBtnOnTap;

  const DeleteDailog({super.key, required this.deleteBtnOnTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure you want to delete this student?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(onPressed: deleteBtnOnTap, child: const Text('Delete')),
      ],
    );
  }
}
