import 'package:flutter/material.dart';

import '../../config/app_router.dart';
import '../../constants/dashboard/drawer_list_data.dart';
import 'drawer_list_item.dart';

class NavigationSidebar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const NavigationSidebar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  NavigationSidebarState createState() => NavigationSidebarState();
}

class NavigationSidebarState extends State<NavigationSidebar> {
  int _selectedIndex = -1;

  void _onItemSelected(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1;
      } else {
        _selectedIndex = index;
      }
    });
    widget.onItemSelected(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: const Color(0xff0566BD),
        child: Padding(
            padding: const EdgeInsets.only(left: 48, top: 45, right: 48),
            child: Column(children: [
              Image.network(
                'https://i.ibb.co/3RnTNSc/SPCA-Logo-1-2.png',
                fit: BoxFit.cover,
                width: 204,
                height: 66,
              ),
              const SizedBox(height: 57),
              Expanded(
                  child: ListView.builder(
                      itemCount: drawerList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              _onItemSelected(index);
                              if (drawerList[index]['title'] == 'Dashboard') {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.dashboard);
                              } else if (drawerList[index]['title'] ==
                                  'Notification') {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.notification);
                              } else if (drawerList[index]['title'] ==
                                  'Message') {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.message);
                              } else if (drawerList[index]['title'] ==
                                  'Events') {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.events);
                              } else if (drawerList[index]['title'] ==
                                  'Add Fooster') {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.dataEntryScreen);
                              }
                            },
                            child: DrawerListItem(
                              icon: drawerList[index]['icons'],
                              title: drawerList[index]['title'],
                              isSelected: _selectedIndex == index,
                            ));
                      }))
            ])));
  }
}
