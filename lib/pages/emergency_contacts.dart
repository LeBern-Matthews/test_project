import 'package:flutter/material.dart';


class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {

  String country = "Country"; // Default country value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency contacts"),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20, top: 20),
            child: Text(" For $country", 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider( color: const Color.fromARGB(255, 78, 73, 73), thickness: 1),
          const SizedBox(height: 20),
          FloatingActionButton(onPressed:() {
            setState(() {
              country = "USA";
            });
          }
          )
      ],),
    );
  }
} 