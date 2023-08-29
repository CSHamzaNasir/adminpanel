import 'package:flutter/material.dart';

class PetDetails extends StatelessWidget {
  final String title;
  final String img;
  final String subTitle;
  final IconData imgIcon;
  final String age;
  final String status;
  final Color statusColor;
  final Color borderColor;

  const PetDetails(
      {super.key,
      required this.title,
      required this.img,
      required this.subTitle,
      required this.imgIcon,
      required this.age,
      required this.status,
      required this.statusColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
