import 'package:enuadminpannel/core/widgets/notification_petdetail.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String gender = 'Male';
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
                        ShowDialogue(context);
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

  Future<dynamic> ShowDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Notification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close))
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              height: 617,
              width: 665,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 22),
                        child: buildTextFieldColumn("Pet Name", "Wu Tsui"),
                      ),
                      buildTextFieldColumn("Breed", "Malinois"),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 20),
                        child: buildGenderDropdownColumn(
                            "Gender", "Select Gender"),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 25),
                    child: Row(
                      children: [
                        Text(
                          'Select Option',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6B7280)),
                        ),
                        SizedBox(width: 130),
                        SizedBox(
                          height: 37,
                          width: 190,
                          child: TextField(
                              decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff71717A))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff71717A))),
                            hintText: 'Foster',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff18181B),
                            ),
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                          )),
                        ),
                        SizedBox(width: 22),
                        SizedBox(
                          height: 37,
                          width: 190,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff71717A))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff71717A))),
                              hintText: 'Adoption',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff18181B),
                              ),
                              border: InputBorder.none,
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff18181B)),
                        ),
                        const SizedBox(height: 11),
                        const SizedBox(
                          height: 120,
                          width: 615,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff71717A)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff71717A)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                              width: 173,
                              height: 55,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color(0xff0566BD),
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  child: const Text('Send Notification'))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column buildTextFieldColumn(String labelText, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 190,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff71717A)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff71717A)),
              ),
              hintText: initialValue,
              hintStyle: const TextStyle(
                color: Color(0xff71717A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Column buildGenderDropdownColumn(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 190,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff71717A)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff71717A)),
              ),
              hintText: hintText, // Set the provided hint text
              hintStyle: const TextStyle(
                color: Color(0xff71717A),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
            ),
            items: const [
              DropdownMenuItem<String>(
                value: "Male",
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "Male",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: "Female",
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "Female",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
