import 'package:flutter/material.dart';

import '../core/auth/screen/login_screen.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  MobileBodyState createState() => MobileBodyState();
}

class MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen(),
    );
  }
}
