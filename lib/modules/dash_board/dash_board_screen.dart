import 'package:flutter/material.dart';
import '../../config/app_router.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/pet_detail.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationSidebar(
            selectedIndex: -1,
            onItemSelected: (index) {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const DashboardNavbar(dashboardName: 'Dashboard'),
                  _buildHeaderButtonRow(),
                  const SizedBox(height: 40),
                  const PetDetail(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButtonRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 65, top: 50),
      child: Row(
        children: [
          const Text(
            'Woof woof! Tyler',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333),
            ),
          ),
          const Spacer(),
          _buildCreateAdoptionButton(),
          const SizedBox(width: 8),
          _buildFilterButton(),
          const SizedBox(width: 65),
        ],
      ),
    );
  }

  Widget _buildCreateAdoptionButton() {
    return SizedBox(
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
          padding:
              const EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 12),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Create Adoption Form'),
      ),
    );
  }

  Widget _buildFilterButton() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff6B7280),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 4, right: 9, top: 5, bottom: 4),
        child: SizedBox(
          width: 18.31,
          height: 21.09,
          child: Icon(
            Icons.filter_alt_outlined,
            color: Color(0xff6B7280),
          ),
        ),
      ),
    );
  }
}
