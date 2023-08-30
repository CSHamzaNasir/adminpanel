import 'package:flutter/material.dart';

import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/message_chat.dart';
import '../../core/widgets/navigation_slidebar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Container(
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 219, 215, 215),
                        spreadRadius: 0.3,
                        blurRadius: 1,
                        offset: Offset(2, 2))
                  ]),
                  height: 65,
                  child: const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: DashboardNavbar(dashboardName: 'Message'))),
              const MessageChat()
            ])))
      ]))
    ]));
  }
}
