import 'package:flutter/material.dart';

import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/message_chat.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/responsive_navbar.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool showDrawer = screenWidth < 1100 || screenWidth < 700;
    return Scaffold(
      key: _scaffoldKey,
      appBar: showDrawer
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: ResponsiveNavBar(
                scaffoldKey: _scaffoldKey,
                dashboardName: 'Message',
              ),
            )
          : null,
      drawer: showDrawer
          ? Drawer(
              child: NavigationSidebar(
                selectedIndex: -1,
                onItemSelected: (index) {},
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: screenWidth > 1170,
                  child: NavigationSidebar(
                    selectedIndex: -1,
                    onItemSelected: (index) {},
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: screenWidth > 1100,
                          child: Container(
                            decoration: const BoxDecoration(),
                            height: 65,
                            width: double.infinity,
                            child: const DashboardNavbar(
                                dashboardName: '     Message'),
                          ),
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
