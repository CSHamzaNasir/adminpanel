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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: DashboardNavbar(
                      dashboardName: 'Create Adoption Form',
                    ),
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
                  child: SizedBox(
                    height: 500,
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
                                      height: 330,
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
                                    children: [
                                      ...List.generate(
                                        imageUrls.length,
                                        (index) => Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                height: 81,
                                                width: 85,
                                                child: Image.network(
                                                  imageUrls[index],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            )
                                          ],
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
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, right: 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dsecription',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff18181B)),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1, color: const Color(0xffD4D4D8))),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 22, top: 14, bottom: 20),
                          child: Text(
                            'Wu Tsui (in Cantonese it means Black Mouth) is a survivor of a prosecution case. Due to her abusive experiences, Wu Tsui is very fearful of stick-shaped objects and motorcycles and always gets anxious around these things. Meanwhile, her past also made her very protective of her resources, not allowing others to touch her belongings. However, please do not have bias in her as she is still a very loving furkid at heart who longs for affection. Besides, Wu Tsui also loves going to the park to have a blast with other dogs! Considering she is pretty active, we recommend an experienced family with no children, elderly, and dogs at home to adopt her.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff71717A)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 52,
                          width: 211,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0566BD)),
                                onPressed: () {},
                                child: const Text(
                                  'create',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFEFEFE)),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 63)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
