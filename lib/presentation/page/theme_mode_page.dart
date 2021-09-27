import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModePage extends ConsumerWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(primaryProvider.select(
      (Primary primary) => primary.themeMode,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (_, int index) => RadioListTile<ThemeMode>(
            value: ThemeMode.values[index],
            groupValue: currentThemeMode,
            onChanged: (ThemeMode? themeMode) => ref
                .read(primaryProvider)
                .selectThemeMode(themeMode ?? currentThemeMode),
            title: Text(describeEnum(ThemeMode.values[index])),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: ThemeMode.values.length,
        ),
      ),
    );
  }
}