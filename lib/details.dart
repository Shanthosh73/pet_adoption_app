import 'package:flutter/material.dart';
import 'package:pet_adoption_app/pet.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context)!.settings.arguments as Pet;

    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Hero(
              tag: 'pet_${pet.name}',
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(pet.image),
              ),
            ),
            SizedBox(height: 20),
            Text('Name: ${pet.name}'),
            Text('Age: ${pet.age}'),
            Text('Price: \$${pet.price}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Adoption Successful!'),
                      content: Text('You’ve now adopted ${pet.name}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                pet.isAdopted = true;
              },
              child: Text('Adopt Me'),
            ),
          ],
        ),
      ),
    );
  }
}
