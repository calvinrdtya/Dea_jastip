import 'package:flutter/material.dart';

class ActionAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onYes;
  final VoidCallback onNo;

  const ActionAlert({
    Key? key,
    required this.title,
    required this.content,
    required this.onYes,
    required this.onNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onNo,
          child: Text(
            'No',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onYes,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Yes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

void showActionAlert({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onYes,
  required VoidCallback onNo,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ActionAlert(
        title: title,
        content: content,
        onYes: onYes,
        onNo: onNo,
      );
    },
  );
}
