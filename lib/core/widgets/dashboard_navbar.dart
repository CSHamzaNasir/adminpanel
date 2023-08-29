import 'package:flutter/material.dart';

class DashboardNavbar extends StatelessWidget {
  final String dashboardName; // Add this line

  const DashboardNavbar({
    Key? key,
    required this.dashboardName, // Add this line
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        dashboardName,
        style: const TextStyle(
            color: Color(0xff18181B),
            fontSize: 24,
            fontWeight: FontWeight.w600),
      ),
      const Spacer(),
      SizedBox(
          height: 47,
          width: 47,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(42)),
            child: Image.network('https://picsum.photos/250?image=9'),
          )),
      const SizedBox(width: 20),
      const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Tyler Nix',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          'Admin',
          style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        )
      ]),
      const SizedBox(width: 40),
      const SizedBox(height: 24, width: 24, child: Icon(Icons.notifications)),
    ]);
  }
}
