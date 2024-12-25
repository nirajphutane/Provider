
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/provider/LoginDetails.dart';
import '../core/DataGenerator.dart';
import 'change_notifier_provider/app_state/ThemeNotifier.dart';

List<InheritedProvider> get globalProviders => [
  Provider<LoginDetails>(create: (_) => LoginDetails(DateTime.now(), DataGenerator().getRandomNumber(7))),
  ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier(ThemeMode.light))
];
