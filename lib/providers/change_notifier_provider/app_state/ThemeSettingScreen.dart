
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';

import 'ThemeNotifier.dart';

class ThemeSettingsScreen extends StatelessWidget {

  const ThemeSettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Change Notifier Provider (App State)',
      body: Center(
        child: Switch(
          value: context.watch<ThemeNotifier>().getState,
          onChanged: (bool value) => context.read<ThemeNotifier>().set = value
        )
      )
  );
}
