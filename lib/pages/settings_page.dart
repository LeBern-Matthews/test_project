import 'package:flutter/material.dart';
import 'package:test_project/components/country_selector.dart'; // Add this import

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isCountryExpanded = false;
  bool _isThemeExpanded = false;
  String _selectedCountry = "Select a country"; // Add this variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change the app theme"),
              trailing: IconButton(
                icon: Icon(
                  _isThemeExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                ),
                onPressed: () {
                  setState(() {
                    _isThemeExpanded = !_isThemeExpanded;
                  });
                },
              ),
            ),
            ExpansionTile(
              title: const Text("Country"),
              subtitle: Text(_selectedCountry),
              trailing: Icon(
                _isCountryExpanded
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isCountryExpanded = expanded;
                });
              },
              children: countryOptions().map((country) {
                return ListTile(
                  title: Text(country),
                  onTap: () {
                    setState(() {
                      _selectedCountry = country;
                      _isCountryExpanded = false;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}