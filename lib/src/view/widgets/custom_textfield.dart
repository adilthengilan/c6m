import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final double borderRadius;
  final TextEditingController? controller;
  final BorderSide borderSide;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BorderSide? enabledBorder;
  final TextStyle? labelTextStyle;
  final void Function(String)? onSubmiting;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.borderRadius = 8.0, // Default value for borderRadius
    this.borderSide = const BorderSide(color: Colors.transparent), // Default value for borderSide
    this.suffixIcon,
    this.enabledBorder = const BorderSide(color: Colors.transparent),
    this.labelTextStyle = const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
    this.onSubmiting,
    this.onChanged,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      onSubmitted: onSubmiting,
      onTapOutside: onTapOutside,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelStyle: labelTextStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: borderSide,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: borderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: enabledBorder!,
        ),
      ),
    );
  }
}
