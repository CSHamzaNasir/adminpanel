import 'package:flutter/material.dart';
import '../../config/app_router.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/pet_detail.dart';
import '../../core/widgets/responsive_navbar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
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
                child: ResponsiveNavBar(scaffoldKey: _scaffoldKey))
            : null,
        drawer: showDrawer
            ? Drawer(
                child: NavigationSidebar(
                    selectedIndex: -1, onItemSelected: (index) {}))
            : null,
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (!showDrawer)
            NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            Visibility(
                visible: screenWidth > 1100,
                child: const DashboardNavbar(dashboardName: 'Dashboard')),
            _buildHeaderButtonRow(),
            const SizedBox(height: 40),
            const PetDetail()
          ])))
        ]));
  }

  Widget _buildHeaderButtonRow() {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue =
        screenWidth < 700 ? 5.0 : (screenWidth < 1100 ? 65.0 : 65.0);

    double fontSize = screenWidth < 700 ? 20.0 : 24.0;

    return Padding(
        padding: EdgeInsets.only(left: paddingValue, top: 50),
        child: Row(children: [
          Text('Woof woof! Tyler',
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff333333))),
          const Spacer(),
          _buildCreateAdoptionButton(),
          const SizedBox(width: 8),
          _buildFilterButton(),
          SizedBox(width: paddingValue)
        ]));
  }

  Widget _buildCreateAdoptionButton() {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth;
    double buttonHeight;
    double textsize;

    if (screenWidth < 700) {
      buttonWidth = 150.0;
      buttonHeight = 40.0;
      textsize = 12;
    } else if (screenWidth < 1100) {
      buttonWidth = 180.0;
      buttonHeight = 47.0;
      textsize = 15;
    } else {
      buttonWidth = 211.0;
      buttonHeight = 52.0;
      textsize = 18;
    }
    return SizedBox(
        width: buttonWidth,
        height: buttonHeight,
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
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('Create Adoption Form',
                style: TextStyle(fontSize: textsize))));
  }

  Widget _buildFilterButton() {
    return DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff6B7280), width: 1.0),
            borderRadius: BorderRadius.circular(8)),
        child: const Padding(
            padding: EdgeInsets.only(left: 4, right: 9, top: 5, bottom: 4),
            child: SizedBox(
                width: 18.31,
                height: 21.09,
                child: Icon(Icons.filter_alt_outlined,
                    color: Color(0xff6B7280)))));
  }
}
