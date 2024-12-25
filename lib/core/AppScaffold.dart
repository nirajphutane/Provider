
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final FloatingActionButton? fab;

  const AppScaffold({super.key, required this.title, required this.body, this.fab});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: body,
    floatingActionButton: fab,
  );
}