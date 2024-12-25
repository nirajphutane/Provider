
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/Helpers.dart';
import 'package:providers/providers/provider/LoginDetails.dart';
import '../../core/AppScaffold.dart';

class LastLoginDetailsScreen extends StatelessWidget {

  const LastLoginDetailsScreen({super.key});

  @override
  Widget build(final BuildContext context) {

    final loginDetails = context.read<LoginDetails>();

    return AppScaffold(
        title: 'Stream Provider',
        body: Center(
          child: Column(
            children: [
              Text(loginDetails.loginTime.toIso8601String()),
              Text(loginDetails.loginTime.elapsed()),
              Text(loginDetails.id)
            ]
          )
        )
    );
  }
}