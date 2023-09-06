import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widgets/navigation_slidebar.dart';
import 'add_fooster_data.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  DataEntryScreenState createState() => DataEntryScreenState();
}

class DataEntryScreenState extends State<DataEntryScreen> {
  late int dataEntryCount;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  List<String> savedDataList = [];
  String selectedDropdownItem1 = 'Male';
  String selectedDropdownItem2 = 'Rescue';
  String selectedDropdownItem3 = 'Cat';
  String selectedDropdownItem4 = 'Easy';

  List<String> dropdownItems = ['Male', 'Female'];
  List<String> dropdownItems2 = ['Rescue', 'Abandoned'];
  List<String> dropdownItems3 = ['Cat', 'Dog', 'Other'];
  List<String> dropdownItems4 = ['Easy', 'Medium', 'Hard'];

  @override
  void initState() {
    super.initState();
    loadSavedData();

    dataEntryCount = 7;
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('saved_data');

    setState(() {
      savedDataList = savedData ?? [];
      if (savedDataList.isNotEmpty) {
        List<String> savedDataFields = savedDataList.last.split(",");
        if (savedDataFields.length == 8) {
          textEditingController1.text = savedDataFields[0];
          textEditingController2.text = savedDataFields[1];
          textEditingController3.text = savedDataFields[2];
          textEditingController4.text = savedDataFields[3];
          selectedDropdownItem1 = savedDataFields[4];
          selectedDropdownItem2 = savedDataFields[5];
          selectedDropdownItem3 = savedDataFields[6];
          selectedDropdownItem4 = savedDataFields[7];
        }
      }
    });
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newData1 = textEditingController1.text;
    String newData2 = textEditingController2.text;
    String newData3 = textEditingController3.text;
    String newData4 = textEditingController4.text;
    String newData5 = selectedDropdownItem1;
    String newData6 = selectedDropdownItem2;
    String newData7 = selectedDropdownItem3;
    String newData8 = selectedDropdownItem4;

    if (newData1.isNotEmpty ||
        newData2.isNotEmpty ||
        newData3.isNotEmpty ||
        newData4.isNotEmpty ||
        newData5.isNotEmpty) {
      String newData =
          "$newData1,$newData2,$newData3,$newData4,$newData5,$newData6,$newData7,$newData8";
      savedDataList.add(newData);
      prefs.setStringList('saved_data', savedDataList);
      dataEntryCount++;
    }

    setState(() {
      textEditingController1.clear();
      textEditingController2.clear();
      textEditingController3.clear();
      textEditingController4.clear();
      selectedDropdownItem1 = 'Male';
      selectedDropdownItem2 = 'Rescue';
      selectedDropdownItem3 = 'Cat';
      selectedDropdownItem4 = 'Easy';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 211,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff0566BD),
                          elevation: 5,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 5, left: 5, right: 12),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Enter Fooster Data'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: textEditingController1,
                      decoration: const InputDecoration(
                        hintText: 'Age',
                      ),
                    ),
                    TextField(
                      controller: textEditingController2,
                      decoration: const InputDecoration(
                        hintText: 'Color',
                      ),
                    ),
                    TextField(
                      controller: textEditingController3,
                      decoration: const InputDecoration(
                        hintText: 'Type',
                      ),
                    ),
                    TextField(
                      controller: textEditingController4,
                      decoration: const InputDecoration(
                        hintText: 'Fooster Period',
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedDropdownItem1,
                      items: dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropdownItem1 = newValue ?? 'Male';
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Sex',
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedDropdownItem2,
                      items: dropdownItems2.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropdownItem2 = newValue ?? 'Rescue';
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Source',
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedDropdownItem3,
                      items: dropdownItems3.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropdownItem3 = newValue ?? 'Cat';
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Difficulty',
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedDropdownItem4,
                      items: dropdownItems4.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropdownItem4 = newValue ?? 'Easy';
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Species',
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        saveData();
                      },
                      child: const Text('Enter Data'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: createFoosterData.length,
                      itemBuilder: (context, index) {
                        final fooster = createFoosterData[index];
                        return ListTile(
                          subtitle: Card(
                            child: Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(16.0),
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        child: Text(fooster.patientNo)),
                                    const SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Color: ${fooster.color}'),
                                        Text('Source: ${fooster.source}'),
                                        Text(
                                            'FoosterPeriod: ${fooster.foosterPeriod}'),
                                        Text(
                                            'Difficulty: ${fooster.difficulty}'),
                                        Text('Species: ${fooster.species}'),
                                        Text('Age: ${fooster.age}'),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Type: ${fooster.type}'),
                                        Text('Sex: ${fooster.sex}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Display the saved data
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: savedDataList.length,
                      itemBuilder: (context, index) {
                        List<String> savedDataFields =
                            savedDataList[index].split(",");
                        if (savedDataFields.length == 8) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(18.0),
                                padding: const EdgeInsets.all(18.0),
                                color: Colors.blueAccent,
                                child: Row(
                                  children: [
                                    CircleAvatar(child: Text(' ${index + 1}')),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fooster Period: ${savedDataFields[3]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Color: ${savedDataFields[1]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Source: ${savedDataFields[5]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Difficulty: ${savedDataFields[6]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Age: ${savedDataFields[0]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Species: ${savedDataFields[7]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Type: ${savedDataFields[2]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Sex: ${savedDataFields[4]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
