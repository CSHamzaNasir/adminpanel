import 'package:flutter/material.dart';

import '../../constants/events/events_data.dart';
import 'event_item.dart';

class UpComingEvents extends StatelessWidget {
  const UpComingEvents({
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
            itemCount: upcomingEvents.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EventsItem(
                img: upcomingEvents[index]['img']!,
                event: upcomingEvents[index]['event']!,
                description: upcomingEvents[index]['description']!,
                ins: upcomingEvents[index]['ins']!,
                locIcon: upcomingEvents[index]['locIcon']!,
                loc: upcomingEvents[index]['loc']!,
                drive: upcomingEvents[index]['drive']!,
                drive1: upcomingEvents[index]['drive1']!,
                img1: upcomingEvents[index]['img1']!,
                name: upcomingEvents[index]['name']!,
                date: upcomingEvents[index]['date']!,
              );
            }),
      ),
    );
  }
}
