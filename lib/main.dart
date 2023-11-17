import 'package:flutter/material.dart';
import 'package:tp3/data/liste.dart';
import 'package:tp3/domain/Dog.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Liste dogList = Liste(); // Use your Liste class to get the list of dogs

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("List of Dogs")),
        body: FirstWidget(dogs: dogList.dogList),
      ),
    );
  }
}class FirstWidget extends StatelessWidget {
  final List<Dog> dogs;

  const FirstWidget({Key? key, required this.dogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          final dog = dogs[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                child: Image.asset(
                  dog.imageAsset,
                  width: 120.0,
                  height: double.infinity, // Set the height to cover the entire card
                  fit: BoxFit.cover,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dog.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: dog.gender == "Male" ? Colors.blue : Colors.pink,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      dog.gender,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Text("Age: ${dog.age} years"),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      SizedBox(width: 4.0),
                      Text(dog.distanceAway),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondWidget(dog: dog),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}class SecondWidget extends StatelessWidget {
  final Dog dog;

  const SecondWidget({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dog Details")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            dog.imageAsset,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dog.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: dog.gender == "Male" ? Colors.blue : Colors.pink,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        dog.gender,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text("Age: ${dog.age} years"),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    SizedBox(width: 4.0),
                    Text(dog.distanceAway),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "About Me",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dog.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Quick Info",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${dog.age} years",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Age",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${dog.color}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${dog.weight} kg",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Weight",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
