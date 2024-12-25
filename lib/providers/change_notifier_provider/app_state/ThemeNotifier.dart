
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {

  late ThemeMode _mode;
  ThemeNotifier(this._mode);

  ThemeMode get get => _mode;

  bool get getState => _mode == ThemeMode.dark? true: false;

  set set(final bool isDark) {
    _mode = isDark? ThemeMode.dark: ThemeMode.light;
    notifyListeners();
  }
}