import 'package:flutter/material.dart';
import 'package:pet_adoption_app/pet.dart';

class HistoryPage extends StatelessWidget {
  final List<Pet> pets;

  HistoryPage({required this.pets});

  @override
  Widget build(BuildContext context) {
    List<Pet> adoptedPets = pets.where((pet) => pet.isAdopted).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption History'),
      ),
      body: ListView.builder(
        itemCount: adoptedPets.length,
        itemBuilder: (context, index) {
          final pet = adoptedPets[index];
          return ListTile(
            title: Text(pet.name),
            subtitle: Text('Adopted on: ${DateTime.now().toString()}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(pet.image),
            ),
          );
        },
      ),
    );
  }
}
