import 'package:flutter/material.dart';

class RightChat extends StatelessWidget {
  const RightChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 15),
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
                  height: 50,
                  width: 232,
                  child: const Center(
                    child: Text('Buddy / Mongrel is 1 year old.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '10:00 Am',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff71717A)),
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
              height: 40,
              width: 40,
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
