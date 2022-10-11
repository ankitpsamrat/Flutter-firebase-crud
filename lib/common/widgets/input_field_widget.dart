import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.inputController,
    required this.textInputAction,
    required this.formValidator,
    required this.onSaved,
    required this.icon,
    required this.textName,
    this.toHide = false,
  }) : super(key: key);

  final TextEditingController inputController;
  final TextInputAction textInputAction;
  final FormFieldValidator formValidator;
  final FormFieldSetter onSaved;
  final IconData icon;
  final String textName;
  final bool toHide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      textInputAction: textInputAction,
      validator: formValidator,
      onSaved: onSaved,
      obscureText: toHide,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // icon: Icon(icon),
        prefixIcon: Icon(icon, size: 20),
        labelText: textName,
        // hintText: 'emil',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}