import 'package:flutter/material.dart';
import '../../constants/notification/notification_data.dart';

class NotifiicationPetDetail extends StatelessWidget {
  const NotifiicationPetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(children: [
          DataTable(
            dataRowMinHeight: 93,
            dataRowMaxHeight: 93,
            columns: const [
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ],
            rows: notifPetData.map<DataRow>((data) {
              return DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    }
                    return Colors.white;
                  }),
                  cells: [
                    DataCell(Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.network(data['img']))),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 26, bottom: 27),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(data['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff111827),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ]),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(data['subTitle'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xff6B7280),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  const SizedBox(width: 2),
                                  Text(data['subTitle1'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              )
                            ]),
                      )
                    ])),
                    DataCell(Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 350, top: 26, bottom: 27),
                              child: Column(
                                children: [
                                  Text(
                                    data['day'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    data['time'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 46),
                            Icon(data['imgIcon'],
                                color: const Color(0xffEF4444))
                          ],
                        ))),
                  ]);
            }).toList(),
          )
        ]));
  }
}
