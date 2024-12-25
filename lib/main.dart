import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/GlobalProviders.dart';
import 'Home.dart';
import 'core/DataGenerator.dart';
import 'providers/change_notifier_provider/app_state/ThemeNotifier.dart';
import 'providers/provider/LoginDetails.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: globalProviders,
    builder: (context, _) => MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade500,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade800,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple.shade800,
          foregroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.deepPurple.shade200,
          ),
        ),
        cardColor: Colors.grey.shade800,
        dialogBackgroundColor: Colors.grey.shade800,
      ),
      themeMode: context.watch<ThemeNotifier>().get,
      home: const Home()
    )
  );
}


