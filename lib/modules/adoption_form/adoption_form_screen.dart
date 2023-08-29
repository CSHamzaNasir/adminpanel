import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/dashboard/adoption_form.dart';
import '../../core/widgets/adoption_form_item.dart';
import '../../core/widgets/dashboard_navbar.dart';
import '../../core/widgets/navigation_slidebar.dart';

List<String> imageUrls = [
  'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTAAovymF8hElroxcQ4ZOjKGeTmA4ZoKyNKN-rKYRzVlfU1AXHz',
  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSmAMEpcJ_RfvNOUngEl0wJYBKyxIIWVveurVvTbxdUtmwnRpgQ',
];

class AdoptionFormScreen extends StatefulWidget {
  const AdoptionFormScreen({Key? key}) : super(key: key);

  @override
  State<AdoptionFormScreen> createState() => _AdoptionFormScreenState();
}

class _AdoptionFormScreenState extends State<AdoptionFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationSidebar(selectedIndex: -1, onItemSelected: (index) {}),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 219, 215, 215),
                        spreadRadius: 0.3,
                        blurRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  height: 64,
                  child: const DashboardNavbar(
                    dashboardName: 'Create Adoption Form',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 55, top: 40, bottom: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fill this form',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: trying.length,
                          itemBuilder: (context, index) {
                            final field = trying[index];
                            return AdoptionFormItem(
                              hintText: field['hintText'],
                              title: field['title'],
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 300,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: trying1.length,
                          itemBuilder: (context, index) {
                            final field = trying1[index];
                            return AdoptionFormItem(
                              hintText: field['hintText'],
                              title: field['title'],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Pet Image',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff18181B)),
                                ),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 364,
                                    width: 275,
                                    child: Image.network(
                                      'https://miro.medium.com/v2/resize:fit:1100/0*WW7QFszKa-29Te3z',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Add up to 3 images',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff71717A)),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      imageUrls.length,
                                      (index) => ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          height: 81,
                                          width: 85,
                                          child: Image.network(
                                            imageUrls[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? image =
                                            await picker.pickImage(
                                          source: ImageSource.gallery,
                                        );

                                        if (image != null) {}
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: const Color(0xffE5E7EB),
                                          ),
                                        ),
                                        height: 81,
                                        width: 85,
                                        padding: const EdgeInsets.all(2),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
