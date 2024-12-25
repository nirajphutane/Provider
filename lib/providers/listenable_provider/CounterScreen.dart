
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppLog.dart';
import 'package:providers/core/AppScaffold.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {

  final Counter _counter = Counter(0);

  @override
  void initState() {
    super.initState();
    _counter.addListener(_loggingListener);
  }

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Listenable Provider',
      body: ListenableProvider<Counter>(
        create: (context) => _counter,
        child: const Center(
            child: ShowNumber()
        )
      ),
      fab: FloatingActionButton(
          onPressed: () => _counter.increaseBy1(),
          child: const Icon(Icons.plus_one)
      )
  );

  @override
  void dispose() {
    _counter.removeListener(_loggingListener);
    super.dispose();
  }

  void _loggingListener() => AppLog.d(tag: 'Listenable Provider', message: 'Counter: ${_counter.count.number}');
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

class CounterModel {
  final int number;
  const CounterModel(this.number);
}

class Counter extends Listenable {

  int _count;
  Counter(this._count);

  CounterModel get count => CounterModel(_count);

  final List<VoidCallback> _listeners = [];

  void increaseBy1() {
    _count++;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (final VoidCallback listener in _listeners) {
      listener(); // listener.call();
    }
  }

  @override
  void addListener(final VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(final VoidCallback listener) => _listeners.remove(listener);
}