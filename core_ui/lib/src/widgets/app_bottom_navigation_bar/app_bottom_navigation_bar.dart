import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/app_bottom_navigation_bar_item.dart';
import 'package:core_ui/src/widgets/inherited_app_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(_) {
    return InheritedAppBottomNavigationBarWidget(
      selectedIndex: _selectedIndex,
      child: Builder(builder: (BuildContext context) {
        return Container(
          height: 58,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            children: <Widget>[
              AppBottomNavigationBarItem(
                index: 0,
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                    appLocator.get<AppRouter>().push(MessagesRoute());
                  });
                },
                label: 'chats',
                icon: AppImages.chatsIcon,
              ),
              AppBottomNavigationBarItem(
                index: 1,
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                    appLocator.get<AppRouter>().push(ProfileRoute());
                  });
                },
                label: 'profile',
                icon: AppImages.profileIcon,
              ),
            ],
          ),
        );
      }),
    );
  }
}
