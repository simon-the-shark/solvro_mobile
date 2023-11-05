import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoTile extends StatelessWidget {
  const AppInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AboutListTile(
            dense: true,
            applicationVersion: snapshot.data!.version,
            applicationIcon: SizedBox(
              height: 40,
              child: Image.asset(
                "assets/logo_solvro.png",
              ),
            ),
          );
        }
        return const ListTile();
      },
    );
  }
}
