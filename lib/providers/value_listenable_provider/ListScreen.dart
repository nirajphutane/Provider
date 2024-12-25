
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/AppScaffold.dart';

class ListScreen extends StatelessWidget {

  const ListScreen({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Value Listenable Provider',
      body: Provider<API>(
        create: (_) => const API(100),
        child: const ListBuilder(),
      )
  );
}

class ListBuilder extends StatelessWidget {

  const ListBuilder({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<Item> items = context.watch<API>().fetch();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => Provider<Item>(
          create: (_) => items[index],
          child: ValueListenableProvider<Favorite>.value(
              value: items[index].isFavorite,
              child: const Tile()
          )
      )
    );
  }
}

class Tile extends StatelessWidget {

  const Tile({super.key});

  @override
  Widget build(final BuildContext context) {
    final Item item = context.read<Item>();
    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
          onPressed: (){
            item.isFavorite.value = Favorite(!item.isFavorite.value.isLiked);
          },
          icon: Icon(Icons.favorite, color: context.watch<Favorite>().isLiked? Colors.redAccent: null)
      ),
    );
  }
}

class API {
  final int records;
  const API(this.records);
  List<Item> fetch() => List.generate(records, (index) => Item(index, 'Item-${index+1}') );
}

class Item {
  final int index;
  final String name;
  final ValueNotifier<Favorite> isFavorite;

  Item(this.index, this.name, [bool isFavorite = false]): isFavorite = ValueNotifier<Favorite>(Favorite(isFavorite));
}

class Favorite {
  final bool isLiked;

  const Favorite(this.isLiked);
}



/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/AppScaffold.dart';

class ListScreen extends StatelessWidget {

  const ListScreen({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Value Listenable Provider',
      body: Provider<API>(
        create: (_) => const API(100),
        child: const ListBuilder(),
      )
  );
}

class ListBuilder extends StatelessWidget {

  const ListBuilder({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<Item> items = context.watch<API>().fetch();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => Provider<Item>(
          create: (_) => items[index],
          child: ValueListenableProvider<bool>.value(
              value: items[index].isFavorite,
              child: const Tile()
          )
      )
    );
  }
}

class Tile extends StatelessWidget {

  const Tile({super.key});

  @override
  Widget build(final BuildContext context) {
    final Item item = context.read<Item>();
    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
          onPressed: (){
            item.isFavorite.value = !item.isFavorite.value;
          },
          icon: Icon(Icons.favorite, color: context.watch<bool>()? Colors.redAccent: null)
      ),
    );
  }
}

class API {
  final int records;
  const API(this.records);
  List<Item> fetch() => List.generate(records, (index) => Item(index, 'Item-${index+1}') );
}

class Item {
  final int index;
  final String name;
  final Favorite isFavorite;

  Item(this.index, this.name, [bool isFavorite = false]): isFavorite = Favorite(isFavorite);
}

class Favorite extends ValueNotifier<bool>{

  Favorite(super.value);
}
*/