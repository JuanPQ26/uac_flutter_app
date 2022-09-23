import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/views/screens/physical/strength.dart';
import 'package:uac_flutter_app/src/views/screens/physical/distance.dart';

class PhysicalView extends StatefulWidget {
  const PhysicalView({super.key});

  @override
  State<PhysicalView> createState() => _PhysicalViewState();
}

class _PhysicalViewState extends State<PhysicalView> {
  int _selectedIndex = 0;

  static const TextStyle appBarTitleStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontSize: 25,
      fontWeight: FontWeight.w800);

  static final List<Map<String, Widget>> _widgetOptions = [
    {"title": const Text("Fuerza"), "content": const StrengthView()},
    {"title": const Text("Distancia"), "content": const DistanceView()},
    {"title": const Text("Tiro Parabolico"), "content": Container()},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions[_selectedIndex]['title'],
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: appBarTitleStyle,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _widgetOptions[_selectedIndex]["content"],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: "Fuerza"),
          BottomNavigationBarItem(
              icon: Icon(Icons.social_distance), label: "Distancia"),
          BottomNavigationBarItem(
              icon: Icon(Icons.swipe), label: "Tipo Parabolico")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
