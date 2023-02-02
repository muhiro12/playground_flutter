import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlatformListView extends ConsumerWidget {
  const PlatformListView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final designSystem = ref.watch(
      primaryProvider.select((Primary primary) => primary.designSystem),
    );
    switch (designSystem.platform(context)) {
      case DesignPlatform.material:
        return ListView.separated(
          itemBuilder: (_, int index) => children[index],
          separatorBuilder: (_, __) => const Divider(),
          itemCount: children.length,
        );
      case DesignPlatform.cupertino:
        return ColoredBox(
          color: Theme.of(context).brightness == Brightness.light
              ? CupertinoColors.systemGroupedBackground.color
              : CupertinoColors.systemGroupedBackground.darkColor,
          child: SingleChildScrollView(
            child: CupertinoFormSection.insetGrouped(
              children: children,
            ),
          ),
        );
    }
  }
}
