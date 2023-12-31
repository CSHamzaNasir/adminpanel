import 'package:flutter/material.dart';

import 'drawer_list_item.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  DrawerListState createState() => DrawerListState();
}

class DrawerListState extends State<DrawerList> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> drawerList = [
    {'icons': Icons.home, 'title': 'Home'},
    {'icons': Icons.settings, 'title': 'Settings'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: const Color(0xff0566BD),
        child: Padding(
            padding: const EdgeInsets.only(left: 48, top: 45, right: 48),
            child: Column(children: [
              Image.network(
                  'https://images.squarespace-cdn.com/content/v1/5982fa4fe58c62cb28091fa4/1583424203893-6HL2VVUIXK3PEIBXKSVL/image-asset.jpeg?format=1500w',
                  fit: BoxFit.cover,
                  width: 204,
                  height: 66),
              const SizedBox(height: 57),
              Expanded(
                  child: ListView.builder(
                      itemCount: drawerList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_selectedIndex == index) {
                                  _selectedIndex = -1;
                                } else {
                                  _selectedIndex = index;
                                }
                              });
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
