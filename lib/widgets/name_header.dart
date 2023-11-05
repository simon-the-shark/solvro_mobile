import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({super.key, this.color, this.fontSize = 28});
  final Color? color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Solvro Taskmanager",
      textAlign: TextAlign.center,
      style: GoogleFonts.rowdies(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
