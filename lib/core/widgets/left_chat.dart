import 'package:flutter/material.dart';

class LeftChat extends StatelessWidget {
  const LeftChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imgHeight;
    double imgWidth;
    double boxHeight;
    double boxWidth;
    double textSize;
    if (screenWidth < 700) {
      imgHeight = 20.0;
      imgWidth = 20.0;
      boxHeight = 20.0;
      boxWidth = 100.0;
      textSize = 8.0;
    } else if (screenWidth < 1100) {
      imgHeight = 40.0;
      imgWidth = 40.0;
      boxHeight = 40.0;
      boxWidth = 170.0;
      textSize = 12.0;
    } else {
      imgHeight = 40.0;
      imgWidth = 40.0;
      boxHeight = 50.0;
      boxWidth = 190.0;
      textSize = 14.0;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: imgHeight,
              width: imgWidth,
              child: Image.network(
                'https://images.unsplash.com/photo-1510520434124-5bc7e642b61d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Container(
                    color: const Color(0xff0566BD),
                    height: boxHeight,
                    width: boxWidth,
                    child: Center(
                      child: Text('How old are they?',
                          style: TextStyle(
                              fontSize: textSize,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '10:00 Am',
                  style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff71717A)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
