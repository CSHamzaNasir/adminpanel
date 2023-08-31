import 'package:flutter/material.dart';

import '../../core/widgets/adoption_description.dart';
import '../../core/widgets/adoption_form.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';

class AdoptionFormScreen extends StatefulWidget {
  const AdoptionFormScreen({Key? key}) : super(key: key);

  @override
  State<AdoptionFormScreen> createState() => _AdoptionFormScreenState();
}

class _AdoptionFormScreenState extends State<AdoptionFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
      Expanded(
          child: ListView(children: [
        Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 219, 215, 215),
                  spreadRadius: 0.3,
                  blurRadius: 1,
                  offset: Offset(2, 2))
            ]),
            height: 64,
            child: const Padding(
                padding: EdgeInsets.only(left: 40),
                child: DashboardNavbar(
                  dashboardName: 'Create Adoption Form',
                ))),
        const Padding(
            padding: EdgeInsets.only(left: 55, top: 40),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Fill this form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )))),
        const AdoptionForm(),
        const AdoptionDescription()
      ]))
    ]));
  }
}
