import 'package:flutter/material.dart';
import '../../core/widgets/navigation_slidebar.dart';
import 'add_fooster_data.dart';

class AddFooster extends StatefulWidget {
  const AddFooster({Key? key}) : super(key: key);

  @override
  State<AddFooster> createState() => _AddFoosterState();
}

class _AddFoosterState extends State<AddFooster> {
  String? selectedValue;
  final GlobalKey<FormState> _ageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _typeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fosterPeriodFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _colorFormKey = GlobalKey<FormState>();

  String? selectedSource; // Initialize with a default value
  String? selectedDifficulty; // Initialize with a default value
  String? selectedSpecies; // Initialize with a default value

  // Arrays for dropdown items
  final List<DropdownMenuItem<String>> sourceItems = [
    const DropdownMenuItem(
      value: "rescue",
      child: Text("Rescue"),
    ),
    const DropdownMenuItem(
      value: "abandoned",
      child: Text("Abandoned"),
    ),
  ];

  final List<DropdownMenuItem<String>> difficultyItems = [
    const DropdownMenuItem(
      value: "easy",
      child: Text("Easy"),
    ),
    const DropdownMenuItem(
      value: "medium",
      child: Text("Medium"),
    ),
    const DropdownMenuItem(
      value: "hard",
      child: Text("Hard"),
    ),
  ];

  final List<DropdownMenuItem<String>> speciesItems = [
    const DropdownMenuItem(
      value: "cat",
      child: Text("Cat"),
    ),
    const DropdownMenuItem(
      value: "dog",
      child: Text("Dog"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _showDialog(context);
                },
                icon: const Icon(Icons.add),
              ),
              const Text('Add Fooster/Adopter'),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
          Expanded(
            child: ListView.builder(
              itemCount: createFoosterData.length,
              itemBuilder: (BuildContext context, int index) {
                final fooster = createFoosterData[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          fooster.patientNo.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: Text(
                        '${fooster.color} ${fooster.species}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Age: ${fooster.age}'),
                          Text('Sex: ${fooster.sex}'),
                          Text('Species: ${fooster.species}'),
                          Text('Source: ${fooster.source}'),
                          Text('Difficulty: ${fooster.difficulty}'),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${fooster.type}'),
                          Text('FoosterPeriod: ${fooster.foosterPeriod}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
                              fontSize: 24, fontWeight: FontWeight.w600),
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
                        _buildTextField("Age", Icons.pets, _ageFormKey),
                        const SizedBox(height: 20),
                        _buildTextField(
                            "Type", Icons.format_list_bulleted, _typeFormKey),
                        const SizedBox(height: 20),
                        _buildTextField("Fosster Period", Icons.schedule,
                            _fosterPeriodFormKey),
                        const SizedBox(height: 20),
                        _buildTextField("Color", Icons.palette, _colorFormKey),
                        const SizedBox(height: 20),
                        _buildDropdown("Source", selectedSource, sourceItems),
                        const SizedBox(height: 20),
                        _buildDropdown(
                            "Difficulty", selectedDifficulty, difficultyItems),
                        const SizedBox(height: 20),
                        _buildDropdown(
                            "Species", selectedSpecies, speciesItems),
                        const SizedBox(height: 20),
                        _buildDropdown("Select Gender", selectedValue, [
                          const DropdownMenuItem(
                            value: "Male",
                            child: Text("Male"),
                          ),
                          const DropdownMenuItem(
                            value: "Female",
                            child: Text("Female"),
                          ),
                        ]),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 360,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_ageFormKey.currentState!.validate() &&
                                  _typeFormKey.currentState!.validate() &&
                                  _fosterPeriodFormKey.currentState!
                                      .validate() &&
                                  _colorFormKey.currentState!.validate()) {
                                // Handle form submission here
                              }
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

  Widget _buildTextField(
      String labelText, IconData icon, GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  icon,
                  size: 20,
                ),
                labelText: labelText,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Field is required";
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildDropdown(String labelText, String? selectedValue,
      List<DropdownMenuItem<String>> items) {
    return Form(
      key: GlobalKey<FormState>(), // Use a unique GlobalKey for each Form
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6B7280)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,
            ),
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            items: items,
            hint: Text("Select $labelText"),
          ),
        ],
      ),
    );
  }
}
