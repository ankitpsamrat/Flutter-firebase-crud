import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.btnName, required this.onPressed})
    : super(key: key);

  final String btnName;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 5,
      borderRadius: BorderRadius.circular(8),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(25, 13, 25, 13),
        onPressed: onPressed,
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
