import 'package:flutter/material.dart';

import '../../constants/dashboard/pet_details_data.dart';

class NotifiicationPetDetail extends StatelessWidget {
  const NotifiicationPetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(children: [
          DataTable(
            dataRowMinHeight: 72,
            dataRowMaxHeight: 72,
            columns: const [
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ],
            rows: petData.map<DataRow>((data) {
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
                          padding: const EdgeInsets.only(top: 16, bottom: 18),
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
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Icon(data['imgIcon']),
                                  )
                                ]),
                                const SizedBox(height: 6),
                                Text(data['subTitle'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff6B7280),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ))
                              ]))
                    ])),
                    DataCell(Container(
                        alignment: Alignment.center,
                        width: 356,
                        child: Text(
                          data['age'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ))),
                    DataCell(Padding(
                        padding: const EdgeInsets.only(left: 50, right: 30),
                        child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.transparent),
                                    color: data['borderColor'],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16))),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 2,
                                      bottom: 2,
                                    ),
                                    child: Text(data['status'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: data['statusColor'],
                                        )))))))
                  ]);
            }).toList(),
          )
        ]));
  }
}
