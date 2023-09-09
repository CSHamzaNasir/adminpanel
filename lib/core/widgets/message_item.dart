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
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding;
    double rightPadding;
    double textSize;
    double textSizeType;
    double imgHeight;
    double imgWidth;
    double times;

    if (screenWidth < 700) {
      leftPadding = 1.0;
      rightPadding = 1.0;
      textSize = 10.0;
      textSizeType = 8.0;
      imgHeight = 20.0;
      imgWidth = 20.0;
      times = 6.0;
    } else if (screenWidth < 1100) {
      leftPadding = 12.0;
      rightPadding = 30.0;
      textSize = 10.0;
      textSizeType = 12.0;
      imgHeight = 40.0;
      imgWidth = 40.0;
      times = 8.0;
    } else {
      leftPadding = 24.0;
      rightPadding = 41.0;
      textSize = 18.0;
      textSizeType = 14.0;
      imgHeight = 80.0;
      imgWidth = 80.0;
      times = 12.0;
    }

    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: imgHeight,
              width: imgWidth,
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Visibility(
            visible: screenWidth > 1100,
            child: const SizedBox(width: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontSize: textSizeType,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff6B7280),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff111827),
                ),
              ),
              Text(
                old,
                style: TextStyle(
                  fontSize: textSizeType,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4B5563),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: TextStyle(
              fontSize: times,
              fontWeight: FontWeight.w400,
              color: const Color(0xff71717A),
            ),
          ),
        ],
      ),
    );
  }
}
