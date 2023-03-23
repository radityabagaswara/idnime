import 'package:flutter/material.dart';
import 'package:sch/screens/explore.dart';
import 'package:sch/screens/members.dart';
import 'package:sch/screens/homepage.dart';
import 'package:sch/screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme:
          ThemeData(primaryColor: Colors.red[400], primarySwatch: Colors.red),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
//test
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final screens = [
    const HomepageScreen(),
    ExploreScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: botNavBar(),
      body: screens[_currentIndex],
    );
  }

  BottomNavigationBar botNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmarks), label: "Bookmark"),
        BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded), label: "Anime News"),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
