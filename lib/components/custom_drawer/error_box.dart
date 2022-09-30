import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == '') {
      return Container();
    }

    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              'Oops! ${message.toString()}. Por favor, tente de novo.',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
