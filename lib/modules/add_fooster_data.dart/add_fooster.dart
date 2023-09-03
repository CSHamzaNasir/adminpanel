import 'package:enuadminpannel/modules/add_fooster_data.dart/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widgets/navigation_slidebar.dart';
import 'add_fooster_data.dart';
import 'fooster_card.dart';

class AddFoosters extends StatefulWidget {
  const AddFoosters({Key? key}) : super(key: key);

  @override
  State<AddFoosters> createState() => _AddFoostersState();
}

class _AddFoostersState extends State<AddFoosters> {
  Map<String, String?> enteredData = {};
  final GlobalKey<FormState> _ageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _typeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fosterPeriodFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _colorFormKey = GlobalKey<FormState>();
  late TextEditingController ageController;
  late TextEditingController typeController;
  late TextEditingController fosterPeriodController;
  late TextEditingController colorController;

  String? selectedSource = "Source1"; // Set a default value

  String? selectedDifficulty;
  String? selectedSpecies;
  String? selectedValue;

  // Show entered data in a Card
  List<Map<String, String?>> enteredDataList = [];

  @override
  void initState() {
    super.initState();
    ageController = TextEditingController();
    typeController = TextEditingController();
    fosterPeriodController = TextEditingController();
    colorController = TextEditingController();

    // Load saved data from SharedPreferences
    loadSavedData();
  }

  @override
  void dispose() {
    ageController.dispose();
    typeController.dispose();
    fosterPeriodController.dispose();
    colorController.dispose();
    super.dispose();
  }

  // Load saved data from SharedPreferences
  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      ageController.text = prefs.getString('age') ?? '';
      typeController.text = prefs.getString('type') ?? '';
      fosterPeriodController.text = prefs.getString('fosterPeriod') ?? '';
      colorController.text = prefs.getString('color') ?? '';
      selectedSource = prefs.getString('selectedSource');
      selectedDifficulty = prefs.getString('selectedDifficulty');
      selectedSpecies = prefs.getString('selectedSpecies');
      selectedValue = prefs.getString('selectedValue');
    });
  }

  void _showEnteredData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: enteredDataList
                  .map(
                    (enteredData) => Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age: ${enteredData['Age']}'),
                            Text('Type: ${enteredData['Type']}'),
                            // Add other fields here
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Save data to SharedPreferences
  Future<void> saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('age', ageController.text);
    prefs.setString('type', typeController.text);
    prefs.setString('fosterPeriod', fosterPeriodController.text);
    prefs.setString('color', colorController.text);
    prefs.setString('selectedSource', selectedSource ?? '');
    prefs.setString('selectedDifficulty', selectedDifficulty ?? '');
    prefs.setString('selectedSpecies', selectedSpecies ?? '');
    prefs.setString('selectedValue', selectedValue ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff0566BD),
                      elevation: 5,
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 50,
                        right: 50,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Create Adoption Form'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          createFoosterData.length + enteredDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < createFoosterData.length) {
                          final fooster = createFoosterData[index];
                          return FoosterCard(fooster: fooster);
                        } else {
                          final enteredIndex = index - createFoosterData.length;
                          final enteredData = enteredDataList[enteredIndex];
                          return FoosterCard(
                            fooster: CreateFooster(
                              0.0, // You can set this to a unique value if needed
                              enteredData['Age'] ?? '',
                              '', // Set the appropriate sex field
                              enteredData['Color'] ?? '',
                              enteredData['Source'] ?? '',
                              enteredData['Difficulty'] ?? '',
                              enteredData['Species'] ?? '',
                              enteredData['Type'] ?? '',
                              enteredData['Foster Period'] ?? '',
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 675,
            height: 449,
            child: Padding(
              padding: const EdgeInsets.only(left: 75, right: 76, top: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        const Text(
                          "New Fooster/Adopter",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        _buildTextField(
                          "Age",
                          Icons.pets,
                          _ageFormKey,
                          ageController,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          "Type",
                          Icons.format_list_bulleted,
                          _typeFormKey,
                          typeController,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          "Foster Period",
                          Icons.schedule,
                          _fosterPeriodFormKey,
                          fosterPeriodController,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          "Color",
                          Icons.palette,
                          _colorFormKey,
                          colorController,
                        ),
                        const SizedBox(height: 20),
                        _buildDropdown(
                          "Source",
                          selectedSource,
                          sourceItems,
                        ),
                        const SizedBox(height: 20),
                        _buildDropdown(
                          "Difficulty",
                          selectedDifficulty,
                          difficultyItems,
                        ),
                        const SizedBox(height: 20),
                        _buildDropdown(
                          "Species",
                          selectedSpecies,
                          speciesItems,
                        ),
                        const SizedBox(height: 20),
                        _buildDropdown(
                          "Select Gender",
                          selectedValue,
                          [
                            const DropdownMenuItem(
                              value: "Male",
                              child: Text("Male"),
                            ),
                            const DropdownMenuItem(
                              value: "Female",
                              child: Text("Female"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 360,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              final enteredData = {
                                'Age': ageController.text,
                                'Type': typeController.text,
                                'Foster Period': fosterPeriodController.text,
                                'Color': colorController.text,
                                'Source': selectedSource,
                                'Difficulty': selectedDifficulty,
                                'Species': selectedSpecies,
                                'Select Gender': selectedValue,
                              };
                              // Add the entered data to the list
                              enteredDataList.add(enteredData);

                              // Save data to SharedPreferences
                              saveDataToSharedPreferences();

                              // Clear input fields
                              ageController.clear();
                              typeController.clear();
                              fosterPeriodController.clear();
                              colorController.clear();
                              selectedSource = null;
                              selectedDifficulty = null;
                              selectedSpecies = null;
                              selectedValue = null;

                              Navigator.pop(context);
                              _showEnteredData(context);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff0566BD),
                              elevation: 5,
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Create Fooster/Adopter'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, IconData icon,
      GlobalKey<FormState> formKey, TextEditingController controller) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(
      String label, String? value, List<DropdownMenuItem<String>> items) {
    return Form(
      child: DropdownButtonFormField<String>(
        value: value,
        items: items,
        onChanged: (newValue) {
          setState(() {
            if (label == 'Source') {
              selectedSource = newValue;
            } else if (label == 'Difficulty') {
              selectedDifficulty = newValue;
            } else if (label == 'Species') {
              selectedSpecies = newValue;
            } else if (label == 'Select Gender') {
              selectedValue = newValue;
            }
          });
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}

// Define your dropdown items here
List<DropdownMenuItem<String>> sourceItems = [
  const DropdownMenuItem(
    value: "Source1",
    child: Text("Source 1"),
  ),
  const DropdownMenuItem(
    value: "Source2",
    child: Text("Source 2"),
  ),
  // Add more unique items as needed
];

List<DropdownMenuItem<String>> difficultyItems = [
  const DropdownMenuItem(
    value: "Easy",
    child: Text("Easy"),
  ),
  const DropdownMenuItem(
    value: "Medium",
    child: Text("Medium"),
  ),
  // Add more unique items as needed
];

List<DropdownMenuItem<String>> speciesItems = [
  const DropdownMenuItem(
    value: "Species1",
    child: Text("Species 1"),
  ),
  const DropdownMenuItem(
    value: "Species2",
    child: Text("Species 2"),
  ),
  // Add more unique items as needed
];
