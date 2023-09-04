import 'package:enuadminpannel/responsive/responsive.dart';
import 'package:enuadminpannel/responsive/tablet.dart';
import 'package:flutter/material.dart';

import 'desktop.dart';
import 'mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ResponsiveLayout(
      mobileBody: MobileBody(),
      tabletBody: TabletBody(),
      desktopBody: DesktopBody(),
    ));
  }
}
