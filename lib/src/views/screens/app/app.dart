import 'package:flutter/material.dart';
import 'package:uac_flutter_app/src/views/widgets/navigation_bar.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _selectedIndex = 0;

  static const TextStyle appBarTitleStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontSize: 25,
      fontWeight: FontWeight.w800);

  static final List<Map<String, Widget>> _widgetOptions = [
    {"title": const Text("Home"), "content": Container()},
    {"title": const Text("Search"), "content": Container()},
    {"title": const Text("Account"), "content": Container()},
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          titleTextStyle: appBarTitleStyle,
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 0,
                    child: Text('Fisica'),
                  ),
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Potencia'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Factorial'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Cerrar Sesion'),
                  ),
                ];
              },
              onSelected: ((value) {
                switch (value) {
                  case 0:
                    Navigator.pushNamed(context, '/physical');
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/potency');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/factorial');
                    break;
                  case 3:
                    Navigator.popAndPushNamed(context, '/login');
                    break;
                  default:
                }
              }),
            )
          ]),
      body: _widgetOptions[_selectedIndex]["content"],
      bottomNavigationBar: CustomNavigationBar(
          selectedIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
