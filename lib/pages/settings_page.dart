import 'package:flutter/material.dart';
import 'package:test_project/components/country_selector.dart'; // Add this import
import 'package:provider/provider.dart';
import 'package:test_project/themes/theme_provider.dart';
import 'package:test_project/themes/light_mode.dart';
import 'package:test_project/themes/dark_mode.dart';

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
            SizedBox(height: 30),
            ExpansionTile(
              title: const Text("Theme"),
              subtitle: const Text("Change the app theme"),
              trailing: Icon(
                _isThemeExpanded
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isThemeExpanded = expanded;
                });
              },
              children: [
                ListTile(
                  title: const Text("Light"),
                  leading: const Icon(Icons.light_mode),
                  onTap: () {
                    // Get the ThemeProvider and set light theme
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setTheme(lightmode);
                    setState(() {
                      _isThemeExpanded = false; // Close the expansion tile
                    });
                  },
                ),
                ListTile(
                  title: const Text("Dark"),
                  leading: const Icon(Icons.dark_mode),
                  onTap: () {
                    // Get the ThemeProvider and set dark theme
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setTheme(darkmode);
                    setState(() {
                      _isThemeExpanded = false; // Close the expansion tile
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
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