
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';

class CounterScreen extends StatelessWidget {

  final Counter counter = Counter(0);

  CounterScreen({super.key});

  @override
  Widget build(final BuildContext context) => ChangeNotifierProvider(
      create: (context) => Counter(0),
      child: Consumer<Counter>(
        builder: (context, counterNotifier, child) => AppScaffold(
            title: 'Change Notifier Provider with Consumer',
            body: const Center(
                child: ShowNumber()
            ),
            fab: FloatingActionButton(
                onPressed: () => context.read<Counter>().increaseBy1(),
                child: const Icon(Icons.plus_one)
            )
        )
      )
  );
}

class ShowNumber extends StatelessWidget {

  const ShowNumber({super.key});

  @override
  Widget build(final BuildContext context) => Text(
      '${context.watch<Counter>().count.number}',
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
  );
}

class Counter extends ChangeNotifier {

  late int _counter;
  Counter(this._counter);

  CounterModel get count => CounterModel(_counter);

  void increaseBy1() {
    CounterModel(++_counter);
    notifyListeners();
  }
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}