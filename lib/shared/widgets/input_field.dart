import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? labelText;
  final String placeholder;
  final Color color;
  final double fontSize;
  final bool password;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.placeholder = '',
    this.color = Colors.black87,
    this.fontSize = 18,
    this.password = false,
    this.labelText,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        fillColor: Colors.transparent,
        // contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: color,
        //   ),
        // ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        // labelStyle: TextStyle(
        //   fontSize: fontSize - 2,
        //   color: color,
        //   height: 0.2,
        //   fontWeight: FontWeight.normal,
        // ),
        hintText: placeholder,
        // hintStyle: TextStyle(
        //   fontSize: fontSize,
        //   color: color,
        //   fontWeight: FontWeight.normal,
        // ),
        filled: true,
        isDense: true,
      ),
      controller: controller,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: keyboardType,
      obscureText: password,
      autocorrect: false,
      validator: validator,
    );
  }
}
