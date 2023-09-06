import 'package:flutter/material.dart';

import '../core/auth/screen/login_screen.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  TabletBodyState createState() => TabletBodyState();
}

class TabletBodyState extends State<TabletBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen(),
    );
  }
}
