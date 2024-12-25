
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';

class CounterScreen extends StatelessWidget {

  CounterScreen({super.key});

  final Counter counter = Counter(const CounterModel(0));

  @override
  Widget build(final BuildContext context) => ValueListenableProvider<CounterModel>.value(
      value: counter,
      child: Consumer<CounterModel>(
        builder: (context, counterModel, child) => AppScaffold(
            title: 'Value Listenable Provider',
            body: const Center(
                child: ShowNumber()
            ),
            fab: FloatingActionButton(
                onPressed: () => counter.increaseBy1(),
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
      '${context.watch<CounterModel>().number}',
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

class Counter extends ValueNotifier<CounterModel> {

  Counter(super._value);

  CounterModel get count => value;

  void increaseBy1() => value = CounterModel(value.number+1);
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}