import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const DrawerListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            width: 226,
            height: 48,
            color: isSelected ? const Color(0xff0091EF) : null,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12.0),
                  Text(title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ))
                ]))));
  }
}
