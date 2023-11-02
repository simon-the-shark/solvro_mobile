import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text("Solvro Taskmanager",
        textAlign: TextAlign.center,
        style: GoogleFonts.grandstander(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: color,
        ));
  }
}
