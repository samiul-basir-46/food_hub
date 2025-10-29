import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final Widget hint;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final IconData? suffixIcon, prefixIcon;
  final bool? isTrue;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    this.validator,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.isTrue,
    this.controller, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hint: hint,
        fillColor: Color(0xFFF3F1F1),
        filled: true,
        prefixIcon: isTrue == true
            ? Icon(prefixIcon, color: Color(0xFFC2BDBD))
            : null,
        contentPadding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 0,
          bottom: 5,
        ),
        // isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontSize: 20),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
