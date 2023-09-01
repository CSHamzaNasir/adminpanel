import 'package:flutter/material.dart';

import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/message_chat.dart';
import '../../core/widgets/navigation_slidebar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationSidebar(
                    selectedIndex: -1, onItemSelected: (index) {}),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          height: 65,
                          width: double.infinity,
                          child: const DashboardNavbar(
                              dashboardName: '     Message'),
                        ),
                        const MessageChat(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
