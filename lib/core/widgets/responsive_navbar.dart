import 'package:flutter/material.dart';

class ResponsiveNavBar extends StatefulWidget {
  final String dashboardName;
  const ResponsiveNavBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.dashboardName,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  State<ResponsiveNavBar> createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double dashboardTextSize;
    if (screenWidth < 700) {
      dashboardTextSize = 15.0;
    } else if (screenWidth < 1100) {
      dashboardTextSize = 18.0;
    } else {
      dashboardTextSize = 24.0;
    }
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            widget.dashboardName,
            style: TextStyle(
                fontSize: dashboardTextSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          const Spacer(),
          SizedBox(
            height: 47,
            width: 47,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(42)),
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
          ),
          const SizedBox(width: 20),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tyler Nix',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Admin',
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          const SizedBox(
            height: 24,
            width: 24,
            child: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          widget._scaffoldKey.currentState?.openDrawer();
        },
      ),
    );
  }
}
