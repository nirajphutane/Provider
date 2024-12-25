
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {

  final Multiplier multiplier = Multiplier(1);
  final Counter counter = Counter(1);

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'ProxyProvider2',
      body: MultiProvider(
          providers: [
            ProxyProvider0<MultiplierModel>(update: (context, multiply) => multiplier.get),
            ProxyProvider0<CounterModel>(update: (context, count) => counter.count)
          ],
          child: Column(
            children: [
              TextFormField(
                  initialValue: '1',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.text.isEmpty || RegExp(r'^\d*$').hasMatch(newValue.text)) {
                        return newValue;
                      }
                      return oldValue;
                    },
                    ),
                  ],
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Enter a positive number',
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (String value) => setState(() {
                    multiplier.set = int.parse(value);
                  })
              ),

              Expanded(
                child: ProxyProvider2<CounterModel, MultiplierModel, Multiplication>(
                  update: (context, count, multiplier, multiplication) => Multiplication(count.number, multiplier.number),
                  child: const Center(child: ShowNumber()),
                ),
              )
            ]
          )
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
      context.watch<Multiplication>().message,
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

class Multiplier {

  late int _number;
  Multiplier(this._number);

  MultiplierModel get get => MultiplierModel(_number);

  set set(final int number) => _number = number;
}

class MultiplierModel {
  final int number;
  const MultiplierModel(this.number);
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}

class Multiplication {
  final int _number, _multiplier;
  const Multiplication(this._number, this._multiplier);

  String get message => '$_number * $_multiplier = ${_number * _multiplier}';
}