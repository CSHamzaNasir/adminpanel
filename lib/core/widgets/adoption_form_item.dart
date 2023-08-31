import 'package:flutter/material.dart';

class AdoptionFormItem extends StatelessWidget {
  final String hintText;
  final String title;

  const AdoptionFormItem({
    super.key,
    required this.hintText,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color(0xff18181B),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
            width: 360,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffD1D5DB)),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(children: [
              const SizedBox(width: 12),
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff71717A)),
                border: InputBorder.none,
              )))
            ])),
        const SizedBox(height: 15),
      ],
    );
  }
}
