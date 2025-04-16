import 'package:flutter/material.dart';
//import 'package:test_project/essential_checklist_page.dart' as essential_checklist_page;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  double progress = 0.0; // Progress value

  @override
  bool get wantKeepAlive => true; // Preserve state

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.green[100],
            child: const Text(
              "Welcome to the Home Page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            color: Colors.blue[100],
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                ),
                const SizedBox(height: 10),
                Text(
                  "${(progress * 100).toInt()}% Complete", // Display progress percentage
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, backgroundColor: Colors.deepOrange),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}