import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/emergency_contacts.dart';
import 'package:test_project/pages/essential_checklist_page.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/settings_page.dart';
import 'package:test_project/themes/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  final List<Widget> pages = [
    const HomePage(),
    const EssentialChecklistPage(),
    const EmergencyContactsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage, // Show the current page
        children: pages, // Keep all pages in memory
      ),
      bottomNavigationBar: NavigationBar(

        shadowColor: Colors.grey,
        backgroundColor: Theme.of(context).colorScheme.primary,
        height: 60, // Set the background color of the navigation bar
        
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "", tooltip: "Home"),
          NavigationDestination(icon: Icon(Icons.checklist_sharp), label: "", tooltip: "Essential items"),
          NavigationDestination(icon: Icon(Icons.contact_emergency_rounded), label: "", tooltip: "Emergency contacts",),
          NavigationDestination(icon: Icon(Icons.settings), label: "", tooltip: "Settings"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index; // Update the current page index
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}