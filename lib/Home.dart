
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/core/AppScaffold.dart';
import 'package:providers/core/Navigation.dart';
import 'core/Button.dart';
import 'providers/provider/LoginDetails.dart';
import 'package:providers/providers/provider/LastLoginDetailsScreen.dart' as provider;
import 'package:providers/providers/proxy_providers/proxy_provider_0/CounterScreen.dart' as proxy_provider_0;
import 'package:providers/providers/proxy_providers/proxy_provider/CounterScreen.dart' as proxy_provider;
import 'package:providers/providers/proxy_providers/proxy_provider_2/CounterScreen.dart' as proxy_provider_2;
import 'package:providers/providers/change_notifier_provider/ephemeral_state/CounterScreen.dart' as change_notifier_provider_ephemeral;
import 'package:providers/providers/change_notifier_provider/ephemeral_state/consumer/CounterScreen.dart' as change_notifier_provider_consumer;
import 'package:providers/providers/change_notifier_provider.value/CounterScreen.dart' as change_notifier_provider_value;
import 'package:providers/providers/change_notifier_provider/app_state/ThemeSettingScreen.dart' as change_notifier_provider_app;
import 'package:providers/providers/value_listenable_provider/ListScreen.dart' as value_listenable_provider_ls;
import 'package:providers/providers/value_listenable_provider/CounterScreen.dart' as value_listenable_provider_cs;
import 'package:providers/providers/listenable_provider/CounterScreen.dart' as listenable_provider;
import 'package:providers/providers/future_provider/APIScreen.dart' as future_provider;
import 'package:providers/providers/stream_provider/ClockScreen.dart' as stream_provider;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Home',
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButton(
                  text: 'Provider',
                  onTab: () => Navigation.push(context, const provider.LastLoginDetailsScreen())
                ),

                AppButton(
                    text: 'ProxyProvider0',
                    onTab: () => Navigation.push(context, const proxy_provider_0.CounterScreen())
                ),

                AppButton(
                    text: 'ProxyProvider',
                    onTab: () => Navigation.push(context, const proxy_provider.CounterScreen())
                ),

                AppButton(
                    text: 'ProxyProvider2',
                    onTab: () => Navigation.push(context, const proxy_provider_2.CounterScreen())
                ),

                AppButton(
                    text: 'ChangeNotifierProvider (Ephemeral)',
                    onTab: () => Navigation.push(context, change_notifier_provider_ephemeral.CounterScreen())
                ),

                AppButton(
                    text: 'ChangeNotifierProvider with Consumer',
                    onTab: () => Navigation.push(context, change_notifier_provider_consumer.CounterScreen())
                ),

                AppButton(
                    text: 'ChangeNotifierProvider (App)',
                    onTab: () => Navigation.push(context, const change_notifier_provider_app.ThemeSettingsScreen())
                ),

                AppButton(
                    text: 'ChangeNotifierProvider.Value',
                    onTab: () => Navigation.push(context, change_notifier_provider_value.CounterScreen())
                ),

                AppButton(
                    text: 'Value Listenable Provider (LS)',
                    onTab: () => Navigation.push(context, const value_listenable_provider_ls.ListScreen())
                ),

                AppButton(
                    text: 'Value Listenable Provider (CS)',
                    onTab: () => Navigation.push(context, value_listenable_provider_cs.CounterScreen())
                ),

                AppButton(
                    text: 'Listenable Provider',
                    onTab: () => Navigation.push(context, const listenable_provider.CounterScreen())
                ),

                AppButton(
                    text: 'Future Provider',
                    onTab: () => Navigation.push(context, const future_provider.APIScreen())
                ),

                AppButton(
                    text: 'Stream Provider',
                    onTab: () => Navigation.push(context, const stream_provider.ClockScreen())
                )
              ]
            )
          )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(context.read<LoginDetails>().loginTime.toIso8601String(), textAlign: TextAlign.center)
        )
      ]
    )
  );
}