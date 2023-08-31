import 'package:flutter/material.dart';

import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';
import '../../core/widgets/past_events.dart';
import '../../core/widgets/upcoming_events.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 219, 215, 215),
                                      spreadRadius: 0.3,
                                      blurRadius: 1,
                                      offset: Offset(2, 2))
                                ]),
                            height: 65,
                            child: const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child:
                                    DashboardNavbar(dashboardName: 'Events'))),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 58, right: 70),
                          child: Row(children: [
                            const Text('Upcoming Events',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333))),
                            const Spacer(),
                            SizedBox(
                                width: 143,
                                height: 42,
                                child: ElevatedButton(
                                    onPressed: () {
                                      ShowDialogue(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xff0566BD),
                                        elevation: 5,
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 5,
                                            right: 12),
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    child: const Text('Create Event')))
                          ]),
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
                                    color: Color(0xff18181B)),
                              ),
                              Spacer(),
                              Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6B7280)),
                              )
                            ],
                          ),
                        ),
                        const PastEvents()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> ShowDialogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final inputDecorations = [
        const InputDecoration(
            labelText: "Type Event Name", border: OutlineInputBorder()),
      ];

      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: 675,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 30, bottom: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "New SPCA Event",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: inputDecorations.map((decoration) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                      decoration: decoration,
                    ),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                labelText: "Location",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Category",
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "From",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "To", border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
