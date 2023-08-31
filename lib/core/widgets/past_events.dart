import 'package:flutter/material.dart';

import '../../constants/events/events_data.dart';
import 'event_item.dart';

class PastEvents extends StatelessWidget {
  const PastEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 57, right: 63),
      child: SizedBox(
        height: 370,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 23),
            itemCount: pastEvents.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EventsItem(
                img: pastEvents[index]['img']!,
                event: pastEvents[index]['event']!,
                description: pastEvents[index]['description']!,
                ins: pastEvents[index]['ins']!,
                locIcon: pastEvents[index]['locIcon']!,
                loc: pastEvents[index]['loc']!,
                drive: pastEvents[index]['drive']!,
                drive1: pastEvents[index]['drive1']!,
                img1: pastEvents[index]['img1']!,
                name: pastEvents[index]['name']!,
                date: pastEvents[index]['date']!,
              );
            }),
      ),
    );
  }
}
