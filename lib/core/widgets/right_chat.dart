import 'package:flutter/material.dart';

class RightChat extends StatelessWidget {
  const RightChat({
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
    double rightPadding;
    if (screenWidth < 700) {
      imgHeight = 20.0;
      imgWidth = 20.0;
      boxHeight = 20.0;
      boxWidth = 120.0;
      textSize = 8.0;
      rightPadding = 1.0;
    } else if (screenWidth < 1100) {
      imgHeight = 40.0;
      imgWidth = 40.0;
      boxHeight = 40.0;
      boxWidth = 200.0;
      textSize = 12.0;
      rightPadding = 13.0;
    } else {
      imgHeight = 40.0;
      imgWidth = 40.0;
      boxHeight = 50.0;
      boxWidth = 232.0;
      textSize = 14.0;
      rightPadding = 15.0;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: rightPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(8)),
                child: Container(
                  color: const Color(0xffF9FAFB),
                  height: boxHeight,
                  width: boxWidth,
                  child: Center(
                    child: Text('Buddy / Mongrel is 1 year old.',
                        style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6B7280))),
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(50)),
              height: imgHeight,
              width: imgWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSTvyeA04lQ1THdtzUl7TEIvmfGag0Tl4ZKu-TnaBgHa5zb2a3z'),
              )),
        )
      ],
    );
  }
}
