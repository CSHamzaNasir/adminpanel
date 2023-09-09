import 'package:flutter/material.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/past_events.dart';
import '../../core/widgets/responsive_navbar.dart';
import '../../core/widgets/upcoming_events.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> showDialogue(BuildContext context) async {
    final screenWidth = MediaQuery.of(context).size.width;
    double leftPadding;
    double textSize;
    if (screenWidth < 700) {
      leftPadding = 1.0;
      textSize = 15.0;
    } else if (screenWidth < 1100) {
      leftPadding = 75.0;
      textSize = 24.0;
    } else {
      leftPadding = 75.0;
      textSize = 24.0;
    }

    final inputDecorations = [
      const InputDecoration(
        labelText: "Type Event Name",
        border: OutlineInputBorder(),
      ),
    ];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 675,
            height: 449,
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding, right: 76, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "New SPCA Event",
                        style: TextStyle(
                            fontSize: textSize, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: inputDecorations.map((decoration) {
                      return TextField(
                        decoration: decoration,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                labelText: "Location",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                ),
                                labelText: "Category",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: const Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  ),
                                ),
                                labelText: "From",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: const Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  ),
                                ),
                                labelText: "To",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 360,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xff0566BD),
                            elevation: 5,
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Create Event'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double textSize;
    double buttonWidth;
    double buttonHeight;
    if (screenWidth < 700) {
      textSize = 13.0;
      buttonWidth = 100.0;
      buttonHeight = 20.0;
    } else if (screenWidth < 1100) {
      textSize = 16.0;
      buttonWidth = 110.0;
      buttonHeight = 30.0;
    } else {
      textSize = 24.0;
      buttonWidth = 143.0;
      buttonHeight = 42.0;
    }

    final bool showDrawer = screenWidth < 1100 || screenWidth < 700;
    return Scaffold(
      key: _scaffoldKey,
      appBar: showDrawer
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: ResponsiveNavBar(
                scaffoldKey: _scaffoldKey,
                dashboardName: 'Events',
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: screenWidth > 1100,
                          child: Container(
                            decoration: const BoxDecoration(),
                            height: 65,
                            width: double.infinity,
                            child: const DashboardNavbar(
                                dashboardName: '     Events'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            left: 58,
                            right: 70,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Upcoming Events',
                                style: TextStyle(
                                  fontSize: textSize,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff333333),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: buttonWidth,
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialogue(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xff0566BD),
                                    elevation: 5,
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 5,
                                      left: 5,
                                      right: 12,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: textSize,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Create Event'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        const UpComingEvents(),
                        const SizedBox(height: 20),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 57, right: 63, bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Past Events',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff18181B),
                                ),
                              ),
                              Spacer(),
                              Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PastEvents(),
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
