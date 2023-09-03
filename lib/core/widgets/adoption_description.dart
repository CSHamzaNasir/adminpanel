import 'package:enuadminpannel/config/app_router.dart';
import 'package:flutter/material.dart';

class AdoptionDescription extends StatelessWidget {
  const AdoptionDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 55, right: 55),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Dsecription',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff18181B))),
          const SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: const Color(0xffD4D4D8))),
              child: const Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 22, top: 14, bottom: 20),
                  child: Text(
                    'Wu Tsui (in Cantonese it means Black Mouth) is a survivor of a prosecution case. Due to her abusive experiences, Wu Tsui is very fearful of stick-shaped objects and motorcycles and always gets anxious around these things. Meanwhile, her past also made her very protective of her resources, not allowing others to touch her belongings. However, please do not have bias in her as she is still a very loving furkid at heart who longs for affection. Besides, Wu Tsui also loves going to the park to have a blast with other dogs! Considering she is pretty active, we recommend an experienced family with no children, elderly, and dogs at home to adopt her.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff71717A)),
                  ))),
          const SizedBox(height: 15),
          Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  height: 52,
                  width: 211,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0566BD)),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.addFooster);
                          },
                          child: const Text('create',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFEFEFE))))))),
          const SizedBox(height: 63)
        ]));
  }
}
