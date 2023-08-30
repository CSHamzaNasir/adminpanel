import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String img;
  final String type;
  final String name;
  final String old;
  final String time;

  const MessageItem({
    super.key,
    required this.img,
    required this.type,
    required this.name,
    required this.old,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 41),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280)),
              ),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff111827)),
              ),
              Text(
                old,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4B5563)),
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff71717A)),
          ),
        ],
      ),
    );
  }
}
