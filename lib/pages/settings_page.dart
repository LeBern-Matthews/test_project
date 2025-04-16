import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isCountryExpanded = false; // Add state variable
  bool _isThemeExpanded = false; // Add state variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          DropdownMenu(dropdownMenuEntries: const [
            DropdownMenuEntry<String>(
              value: "English",
              label: "English",
            ),
            DropdownMenuEntry<String>(
              value: "Spanish",
              label: "Spanish",
            ),
            DropdownMenuEntry<String>(
              value: "French",
              label: "French",
            ),
          ], trailingIcon: Icon(Icons.arrow_drop_down_rounded) ,
          selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded),),
          ListTile(
            title: const Text("Theme"),
            subtitle: const Text("Change the app theme"),
            trailing: IconButton(icon: Icon(
                _isThemeExpanded // Use the state variable in ternary operator
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
              onPressed: () {
                setState(() {
                  _isThemeExpanded = !_isThemeExpanded; // Toggle the state
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Country"),
            subtitle: const Text("Change the country"),
            trailing: IconButton(
              icon: Icon(
                _isCountryExpanded // Use the state variable in ternary operator
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
              onPressed: () {
                setState(() {
                  _isCountryExpanded = !_isCountryExpanded; // Toggle the state
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}