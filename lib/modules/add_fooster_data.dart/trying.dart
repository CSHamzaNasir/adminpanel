import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  DataEntryScreenState createState() => DataEntryScreenState();
}

class DataEntryScreenState extends State<DataEntryScreen> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  List<String> savedDataList = [];
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  String selectedDropdownItem1 = 'Option 1';
  String selectedDropdownItem2 = 'Option 1';
  String selectedDropdownItem3 = 'Option 1';

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('saved_data');

    setState(() {
      savedDataList = savedData ?? [];
      if (savedDataList.isNotEmpty) {
        List<String> savedDataFields = savedDataList.last.split(",");
        if (savedDataFields.length == 7) {
          // Update the length to 7 for 3 dropdowns and 4 text fields
          textEditingController1.text = savedDataFields[0];
          textEditingController2.text = savedDataFields[1];
          textEditingController3.text = savedDataFields[2];
          textEditingController4.text = savedDataFields[3];
          textEditingController5.text = savedDataFields[4];
          textEditingController6.text = savedDataFields[5];
          selectedDropdownItem1 =
              savedDataFields[6]; // Load the selected dropdown item
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
    String newData5 = textEditingController5.text;
    String newData6 = textEditingController6.text;
    String newData7 = selectedDropdownItem1;

    if (newData1.isNotEmpty ||
        newData2.isNotEmpty ||
        newData3.isNotEmpty ||
        newData4.isNotEmpty ||
        newData5.isNotEmpty ||
        newData6.isNotEmpty ||
        newData7.isNotEmpty) {
      String newData =
          "$newData1,$newData2,$newData3,$newData4,$newData5,$newData6,$newData7";
      savedDataList.add(newData);
      prefs.setStringList('saved_data', savedDataList);
    }

    setState(() {
      textEditingController1.clear();
      textEditingController2.clear();
      textEditingController3.clear();
      textEditingController4.clear();
      textEditingController5.clear();
      textEditingController6.clear();
      selectedDropdownItem1 = 'Option 1';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent TextField Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController1,
              decoration: const InputDecoration(
                hintText: 'Field 1',
              ),
            ),
            TextField(
              controller: textEditingController2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Field 2',
              ),
            ),
            TextField(
              controller: textEditingController3,
              decoration: const InputDecoration(
                hintText: 'Field 3',
              ),
            ),
            TextField(
              controller: textEditingController4,
              decoration: const InputDecoration(
                hintText: 'Field 4',
              ),
            ),
            TextField(
              controller: textEditingController5,
              decoration: const InputDecoration(
                hintText: 'Field 5',
              ),
            ),
            TextField(
              controller: textEditingController6,
              decoration: const InputDecoration(
                hintText: 'Field 6',
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
                  selectedDropdownItem1 = newValue ?? 'Option 1';
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select an option',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: const Text('Save Data'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: savedDataList.length,
                itemBuilder: (context, index) {
                  List<String> savedDataFields =
                      savedDataList[index].split(",");
                  if (savedDataFields.length == 7) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Field 1: ${savedDataFields[0]}'),
                          Text('Field 2: ${savedDataFields[1]}'),
                          Text('Field 3: ${savedDataFields[2]}'),
                          Text('Field 4: ${savedDataFields[3]}'),
                          Text('Field 5: ${savedDataFields[4]}'),
                          Text('Field 6: ${savedDataFields[5]}'),
                          Text(
                              'Selected Option: ${savedDataFields[6]}'), // Display the selected option
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
