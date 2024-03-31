import 'package:flutter/material.dart';
import 'package:pet_adoption_app/details.dart';
import 'package:pet_adoption_app/history.dart';

import 'package:pet_adoption_app/pet.dart';

void main() {
  List<Pet> pets = [
    Pet(name: 'Tom', age: 2, price: 100, image: 'assets/cat.jpg'),
    Pet(name: 'labrador', age: 3, price: 150, image: 'assets/dog.jpeg'),
    Pet(name: 'Whiskers', age: 1, price: 80, image: 'assets/cat2.jpg'),
    Pet(name: 'Retriever', age: 4, price: 200, image: 'assets/dog2.jpeg'),
    Pet(name: 'Marshmellow', age: 2, price: 120, image: 'assets/dog3.jpeg'),
  ];

  runApp(MyApp(pets: pets));
}

class MyApp extends StatelessWidget {
  final List<Pet> pets;

  const MyApp({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      home: HomePage(pets: pets),
      routes: {
        '/details': (context) => DetailsPage(),
        '/history': (context) => HistoryPage(pets: pets),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Pet> pets;

  const HomePage({Key? key, required this.pets}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Adoption'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.pets.length,
        itemBuilder: (context, index) {
          final pet = widget.pets[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(pet.image),
            ),
            title: Text(pet.name),
            subtitle: Text('Age: ${pet.age}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details', arguments: pet);
              },
              child: Text('Details'),
            ),
          );
        },
      ),
    );
  }
}
