import 'package:enuadminpannel/core/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  DesktopBodyState createState() => DesktopBodyState();
}

class DesktopBodyState extends State<DesktopBody> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
