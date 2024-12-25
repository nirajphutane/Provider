
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/AppScaffold.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatelessWidget {

  const ClockScreen({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Stream Provider',
      body: StreamProvider<Now>(
        initialData: Clock.now(),
        create: (_) => Clock.current(),
        child: const ShowTime(),
      )
  );
}

class ShowTime extends StatelessWidget {

  const ShowTime({super.key});

  @override
  Widget build(final BuildContext context) => Center(
    child: Text(
        context.watch<Now>().now,
        style: const TextStyle(
            fontSize: 40,
            shadows: [
              Shadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 2.5,
                  offset: Offset(-15.0, -15.0)
              ),
              Shadow(
                  color: Colors.purpleAccent,
                  blurRadius: 2.5,
                  offset: Offset(15.0, 15.0)
              )
            ]
        )
    ),
  );
}

class Clock {

  static Now now() => Now(DateFormat('dd/MMM/yyyy - HH:mm:ss').format(DateTime.now()));

  static Stream<Now> current() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield Now(DateFormat('dd/MMM/yyyy - HH:mm:ss').format(DateTime.now()));
    }
  }
}

class Now {
  final String now;
  const Now(this.now);
}