import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarActions extends DelegatingList<Widget> {
  AppBarActions(BuildContext context)
      : super(
          [
            IconButton(
              onPressed: () {
                context.push("/newTask");
              },
              icon: const Icon(
                Icons.add_box,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
        );
}
