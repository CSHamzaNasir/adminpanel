import 'package:enuadminpannel/core/widgets/notification_petdetail.dart';
import 'package:flutter/material.dart';

import '../../config/app_router.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      NavigationSidebar(
        selectedIndex: -1,
        onItemSelected: (index) {},
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Column(children: [
        const DashboardNavbar(
          dashboardName: 'Dashboard',
        ),
        Padding(
            padding: const EdgeInsets.only(left: 65, top: 50, right: 30),
            child: Row(children: [
              const Text('Notification',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              const Spacer(),
              SizedBox(
                  width: 211,
                  height: 52,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.adoption);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff0566BD),
                          elevation: 5,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 5, left: 5, right: 12),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Send New Notification')))
            ])),
        const NotifiicationPetDetail()
      ])))
    ]));
  }
}
