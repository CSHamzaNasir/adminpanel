import 'package:flutter/material.dart';
import '../../constants/dashboard/pet_details_data.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;
    final isMediumScreen = screenWidth < 1100;

    return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.resolveWith(
              (states) => const Color(0xffF0F9FF),
            ),
            dataRowMinHeight: 80,
            dataRowMaxHeight: 80,
            columns: [
              DataColumn(
                label: Padding(
                  padding: EdgeInsets.only(left: isSmallScreen ? 10 : 100),
                  child: const Text('Pet Names'),
                ),
              ),
              DataColumn(
                label: Padding(
                  padding: EdgeInsets.only(left: isSmallScreen ? 10 : 165),
                  child: const Text('Age'),
                ),
              ),
              DataColumn(
                label: Padding(
                  padding: EdgeInsets.only(left: isSmallScreen ? 10 : 95),
                  child: const Text('Status'),
                ),
              ),
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
                  },
                ),
                cells: [
                  DataCell(
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.network(data['img']),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff111827),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Icon(data['imgIcon']),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                data['subTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff6B7280),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Container(
                      alignment: Alignment.center,
                      width: isMediumScreen ? 200 : 356,
                      child: Text(
                        data['age'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: EdgeInsets.only(
                          left: isSmallScreen ? 10 : 50, right: 30),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.transparent),
                            color: data['borderColor'],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 2,
                              bottom: 2,
                            ),
                            child: Text(
                              data['status'],
                              style: TextStyle(
                                fontSize: isSmallScreen ? 10 : 12,
                                color: data['statusColor'],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ));
  }
}
