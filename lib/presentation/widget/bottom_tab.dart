// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/presentation/model/bottom_tab.dart';
import 'package:flutter_playgrounds/presentation/model/bottom_tab_item.dart';

class BottomTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomTab = ref.watch(bottomTabProvider);
    return BottomNavigationBar(
      onTap: (index) => bottomTab.state = BottomTabItem.values[index],
      currentIndex: BottomTabItem.values.indexOf(bottomTab.state),
      items: BottomTabItem.values
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}