import 'package:flutter/material.dart';

class EventsItem extends StatelessWidget {
  final String img;
  final String event;
  final String description;
  final String ins;
  final IconData locIcon;
  final String loc;
  final String drive;
  final String drive1;
  final String img1;
  final String name;
  final String date;

  const EventsItem(
      {super.key,
      required this.img,
      required this.event,
      required this.description,
      required this.ins,
      required this.loc,
      required this.drive,
      required this.drive1,
      required this.img1,
      required this.name,
      required this.date,
      required this.locIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
                height: 174,
                width: 314,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 8),
          Text(
            event,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff4F46E5)),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            ins,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                locIcon,
                color: const Color(0xff10B981),
                size: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                  ),
                  Text(
                    drive,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                  ),
                  Text(
                    drive1,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                            height: 32,
                            width: 32,
                            child: Image.network(
                              img1,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff111827)),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6B7280)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
