import 'package:flutter/material.dart';

class TextFieldWithIconAndText extends StatelessWidget {
  final IconData icon;
  final String hint;

  const TextFieldWithIconAndText({
    Key? key,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD1D5DB)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(children: [
          SizedBox(
              height: 24,
              width: 24,
              child: Icon(icon, color: const Color(0xff71717A))),
          const SizedBox(width: 10),
          const SizedBox(width: 10),
          Expanded(
              child: TextField(
                  decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xff71717A),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          )))
        ]));
  }
}
