import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDateTimeText extends StatefulWidget {
  const CurrentDateTimeText({Key? key}) : super(key: key);

  @override
  State<CurrentDateTimeText> createState() => _CurrentDateTimeTextState();
}

class _CurrentDateTimeTextState extends State<CurrentDateTimeText> {
  late Timer _timer;
  DateTime _currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      setState(() {
        _currentDateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMd("pl").add_Hm().format(_currentDateTime),
    );
  }
}
