import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Orientation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: OrientationBuilder(
        builder: (context, orientation) {
          return (orientation == Orientation.portrait)
              ? const MyHomePagePortraitMode(title: 'Responsive App')
              : const MyHomePageLandscapeMode(title: 'Responsive App');
        },
      ),
    );
  }
}

class MyHomePagePortraitMode extends StatelessWidget {
  const MyHomePagePortraitMode({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold))),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                'assets/images/logo.png',
              ),
              fit: BoxFit.contain,
              height: 200,
              width: 200,
            ),
            Text("Group Members",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Divider(),
            Text("Sohaib Akhtar"),
            Text("Fayez Shahid"),
            Text("Faris Asif"),
          ],
        ),
      ),
      body: const PortraitPage(),
    );
  }
}

class MyHomePageLandscapeMode extends StatelessWidget {
  const MyHomePageLandscapeMode({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold))),
      ),
      body: const LandscapePage(),
    );
  }
}

class LandscapePage extends StatelessWidget {
  const LandscapePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    tileColor: Colors.lightBlue,
                    title: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    tileColor: Colors.lightBlue,
                    title: Text(
                      'Item ${index + 11}',
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('assets/images/logo.png'),
                        fit: BoxFit.contain)),
              ))
        ],
      ),
    );
  }
}

class PortraitPage extends StatelessWidget {
  const PortraitPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              tileColor: Colors.lightBlue,
              title: Text(
                'Item ${index + 1}',
                style: const TextStyle(fontSize: 26),
              ),
            ),
          );
        }),
      ),
    );
  }
}
