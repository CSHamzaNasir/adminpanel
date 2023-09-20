import 'package:enuadminpannel/core/widgets/responsive_navbar.dart';
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
                dashboardName: 'Adoption Form',
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
                  visible: screenWidth > 1100,
                  child: NavigationSidebar(
                    selectedIndex: -1,
                    onItemSelected: (index) {},
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Visibility(
                        visible: screenWidth > 1100,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 219, 215, 215),
                                spreadRadius: 0.3,
                                blurRadius: 1,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          height: 64,
                          child: const DashboardNavbar(
                            dashboardName: 'Create Adoption Form',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 55, top: 40, bottom: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Fill this form',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const AdoptionForm(),
                      const AdoptionDescription(),
                    ],
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
