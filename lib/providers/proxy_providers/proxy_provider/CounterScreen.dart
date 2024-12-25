
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {

  final Counter counter = Counter(0);

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'ProxyProvider',
      body: ProxyProvider0<CounterModel>(
        update: (context, count) => counter.count,
        child: ProxyProvider<CounterModel, CounterMessage>(
          update: (context, count, message) => CounterMessage(count.number),
          child: const Center(
            child: ShowNumber()
          ),
        ),
      ),
      fab: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter.increaseBy1();
          });
        },
        child: const Icon(Icons.plus_one)
      )
  );
}

class ShowNumber extends StatelessWidget {

  const ShowNumber({super.key});

  @override
  Widget build(final BuildContext context) => Text(
      context.watch<CounterMessage>().message,
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

class Counter {

  late int _counter;
  Counter(this._counter);

  CounterModel get count => CounterModel(_counter);

  void increaseBy1() => CounterModel(++_counter);
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}

class CounterMessage {
  final int _number;
  const CounterMessage(this._number);

  String get message {
    switch(_number) {
      case 1: {
        return 'You clicked $_number st time.';
      }

      case 2: {
        return 'You clicked $_number nd time.';
      }

      case 3: {
        return 'You clicked $_number rd time.';
      }

      default: {
        return 'You clicked $_number th time.';
      }
    }
  }
}