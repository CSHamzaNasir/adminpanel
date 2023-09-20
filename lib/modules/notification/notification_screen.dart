import 'package:flutter/material.dart';

import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/notification_petdetail.dart';
import '../../core/widgets/checkbox_widget.dart';
import '../../core/widgets/responsive_navbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _selectedGender;
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedGender = 'Male';
    _textFieldController.text = _selectedGender;
  }

  void _showGenderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGenderOption('Male'),
              _buildGenderOption('Female'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
          _textFieldController.text = gender;
        });
        Navigator.pop(context);
      },
      child: ListTile(
        title: Text(gender),
      ),
    );
  }

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
                dashboardName: 'Dashboard',
              ),
            )
          : null,
      drawer: showDrawer
          ? Drawer(
              child: Visibility(
                visible: screenWidth < 1100,
                child: NavigationSidebar(
                  selectedIndex: -1,
                  onItemSelected: (index) {},
                ),
              ),
            )
          : null,
      body: Row(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                      visible: screenWidth > 1100,
                      child: const DashboardNavbar(dashboardName: 'Dashboard')),
                  _buildNotificationHeader(),
                  const NotifiicationPetDetail(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 65, top: 50, right: 30),
      child: Row(
        children: [
          const Text(
            'Notification',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333),
            ),
          ),
          const Spacer(),
          _buildSendNotificationButton(),
        ],
      ),
    );
  }

  Widget _buildSendNotificationButton() {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonHeight;
    double buttonWidth;
    if (screenWidth < 700) {
      buttonHeight = 25.0;
      buttonWidth = 150.0;
    } else if (screenWidth < 1100) {
      buttonHeight = 35.0;
      buttonWidth = 150.0;
    } else {
      buttonHeight = 52.0;
      buttonWidth = 211.0;
    }
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          _showNotificationDialog(context);
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
        child: const Text('Send New Notification'),
      ),
    );
  }

  Future<void> _showNotificationDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 675,
            height: 617,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDialogTitle(),
                  const SizedBox(height: 52),
                  _buildPetDetailsInputFields(),
                  const SizedBox(height: 16),
                  _buildNotificationOptions(),
                  const SizedBox(height: 33),
                  _buildDescriptionInputField(),
                  const SizedBox(height: 20),
                  _buildSendNotificationButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogTitle() {
    return Row(
      children: [
        const Spacer(),
        const Text(
          "Notification",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildPetDetailsInputFields() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputLabel('Pet Name'),
              const SizedBox(height: 10),
              _buildInputField(labelText: "Wu Tsui"),
            ],
          ),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputLabel('Breed'),
              const SizedBox(height: 10),
              _buildInputField(labelText: "Malinois"),
            ],
          ),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputLabel('Gender'),
              const SizedBox(height: 10),
              _buildGenderInputField(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildInputField({required String labelText}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildGenderInputField() {
    return TextField(
      controller: _textFieldController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select Gender',
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      readOnly: true,
      onTap: () {
        _showGenderDialog(context);
      },
    );
  }

  Widget _buildNotificationOptions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Select Option',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff6B7280),
          ),
        ),
        const SizedBox(width: 122),
        _buildOptionFooster('Foster'),
        const SizedBox(width: 22),
        _buildOptionAdoption('Adoption')
      ],
    );
  }

  Widget _buildOptionFooster(String label) {
    return Container(
      height: 37,
      width: 190,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 100),
          const CheckboxWidget(),
        ],
      ),
    );
  }

  Widget _buildOptionAdoption(String label) {
    return Container(
      height: 37,
      width: 190,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 82),
          const CheckboxWidget(),
        ],
      ),
    );
  }

  Widget _buildDescriptionInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel('Description'),
        const SizedBox(height: 11),
        const TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          maxLines: 5,
        ),
      ],
    );
  }
}
