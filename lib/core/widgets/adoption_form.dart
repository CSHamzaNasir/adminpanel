import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/dashboard/adoption_form_data.dart';
import 'adoption_form_item.dart';

class AdoptionForm extends StatelessWidget {
  const AdoptionForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trying.length,
              itemBuilder: (context, index) {
                final field = trying[index];
                return AdoptionFormItem(
                  hintText: field['hintText'] ?? '',
                  title: field['title'] ?? '',
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trying1.length,
              itemBuilder: (context, index) {
                final field = trying1[index];
                return AdoptionFormItem(
                  hintText: field['hintText'] ?? '',
                  title: field['title'] ?? '',
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pet Image',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff18181B),
                  ),
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
                    color: Color(0xff71717A),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 81,
                        width: 85,
                        child: Image.network(
                          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTAAovymF8hElroxcQ4ZOjKGeTmA4ZoKyNKN-rKYRzVlfU1AXHz',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 81,
                        width: 85,
                        child: Image.network(
                          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSmAMEpcJ_RfvNOUngEl0wJYBKyxIIWVveurVvTbxdUtmwnRpgQ',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {}
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffE5E7EB),
                              )),
                          height: 81,
                          width: 85,
                          padding: const EdgeInsets.all(2),
                          child: const Icon(Icons.add),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
