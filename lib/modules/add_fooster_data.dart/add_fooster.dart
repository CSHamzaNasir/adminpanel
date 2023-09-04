import 'package:flutter/material.dart';

import 'add_fooster_data.dart';

class FoosterListScreen extends StatelessWidget {
  const FoosterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: createFoosterData.length,
        itemBuilder: (context, index) {
          final fooster = createFoosterData[index];
          return ListTile(
            subtitle: Card(
              child: Row(
                children: [
                  CircleAvatar(child: Text(fooster.patientNo)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sex: ${fooster.sex}'),
                      Text('Color: ${fooster.color}'),
                      Text('Source: ${fooster.source}'),
                      Text('Difficulty: ${fooster.difficulty}'),
                      Text('Species: ${fooster.species}'),
                      Text('Age: ${fooster.age}'),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${fooster.type}'),
                      Text('FoosterPeriod: ${fooster.foosterPeriod}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
