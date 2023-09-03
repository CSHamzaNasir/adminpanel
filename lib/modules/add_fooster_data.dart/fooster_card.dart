import 'package:enuadminpannel/modules/add_fooster_data.dart/product.dart';
import 'package:flutter/material.dart';

class FoosterCard extends StatelessWidget {
  final CreateFooster fooster;

  const FoosterCard({super.key, required this.fooster});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
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
    );
  }
}
