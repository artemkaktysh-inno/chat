import 'package:flutter/material.dart';

class InheritedAppBottomNavigationBarWidget extends InheritedWidget {
  const InheritedAppBottomNavigationBarWidget({
    required this.selectedIndex,
    required super.child,
    super.key,
  });

  final int selectedIndex;

  static InheritedAppBottomNavigationBarWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        InheritedAppBottomNavigationBarWidget>();
  }

  static InheritedAppBottomNavigationBarWidget of(BuildContext context) {
    final InheritedAppBottomNavigationBarWidget? result = maybeOf(context);
    assert(result != null, 'No AppBottomNavigationBar found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedAppBottomNavigationBarWidget oldWidget) {
    return oldWidget.selectedIndex != selectedIndex;
  }
}
