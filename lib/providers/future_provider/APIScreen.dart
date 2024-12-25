
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/AppScaffold.dart';

class APIScreen extends StatelessWidget {

  const APIScreen({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Future Provider',
    body: FutureProvider<UIState>(
      initialData: Loading(),
      create: (_) => const API(100).fetch(),
      child: const APIView(),
    )
  );
}

class APIView extends StatelessWidget {

  const APIView({super.key});

  @override
  Widget build(final BuildContext context) {
    switch(context.watch<UIState>()) {
      case Loading(): return const Center(
        child: CircularProgressIndicator()
      );
      case Loaded(): return Provider(
        create: (_) => context.read<UIState>() as Loaded,
        child: const ListBuilder()
      );
    }
  }
}

class ListBuilder extends StatelessWidget {

  const ListBuilder({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<Item> items = context.read<Loaded>().items;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => ListTile(
        leading: const Icon(Icons.eco),
        trailing: const Icon(Icons.monetization_on_outlined),
        title: Text(items[index].name)
      )
    );
  }
}

sealed class UIState {}

class Loading extends UIState {}

class Loaded extends UIState {
  final List<Item> items;
  Loaded(this.items);
}

class API {
  final int records;
  const API(this.records);
  Future<Loaded> fetch() async => Future.delayed(const Duration(seconds: 3)).then((_) {
      return Loaded(List.generate(records, (index) => Item(index, 'Item-${index+1}')));
    });
}

class Item {
  final int index;
  final String name;

  Item(this.index, this.name);
}
