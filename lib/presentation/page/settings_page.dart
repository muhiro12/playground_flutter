import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/app_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('ThemeMode'),
              subtitle: Text(
                ref.watch(
                  primaryProvider.select(
                    (Primary primary) => primary.themeMode.toString(),
                  ),
                ),
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoute.themeMode.name),
            ),
            const Divider(),
            ListTile(
              title: const Text('Color'),
              subtitle: Text(
                ref.watch(
                  primaryProvider.select(
                    (Primary primary) => primary.color.toString(),
                  ),
                ),
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoute.primaryColor.name),
            ),
            const Divider(),
            const AboutListTile(),
          ],
        ),
      ),
    );
  }
}
