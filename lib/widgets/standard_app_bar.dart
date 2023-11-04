import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StandardAppBar extends AppBar {
  final String titleText;

  StandardAppBar(
    BuildContext context, {
    super.key,
    required this.titleText,
  }) : super(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(titleText,
              style: GoogleFonts.grandstander(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        );
}
