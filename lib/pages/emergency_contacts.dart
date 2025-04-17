import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Check if the device can launch the URL.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      // Can't launch the URL
      print('Could not launch $launchUri');
      // Optionally show an error message to the user
    }
  }

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
          const SizedBox(height: 20),
          Divider( color: const Color.fromARGB(255, 188, 177, 177), thickness: 1, indent: 20, endIndent: 20,),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left:20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children: [
                  Text("Police: 911", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  FloatingActionButton(
                  tooltip: "Call Police",
                  child:  Icon(Icons.call),
                  onPressed:() {
                  setState(() {
                  country = "USA";
                  _makePhoneCall("911");
                  });
                  }
                  ),
                  ],
                ),
                
                SizedBox(height: 60),

                Row(
                  children: [
                    Text("Fire Department: 911", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    FloatingActionButton(
                    tooltip: "Call Fire Department",
                    child: const Icon(Icons.call),
                    onPressed:() {
                    setState(() {
                    country = "RUSSIA";
                    _makePhoneCall("911");
                    });
                    }
                ),
                  ],
                ),
                
              SizedBox(height: 60),

                Row(
                  children: [
                    Text("Ambulance: ${911}", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    FloatingActionButton(
                      tooltip: "Call Ambulance",
                      child: const Icon(Icons.call),
                      onPressed:() {
                        setState(() {
                      country = "CANADA";
                      _makePhoneCall("911");
                        });
                                  } // 
          )
                  ],
                ),
                
                SizedBox(height: 60),
                
              ],
            )
            ),

      ],),
    );
  }
} 