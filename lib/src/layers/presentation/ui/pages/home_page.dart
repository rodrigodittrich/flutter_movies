import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    MoviePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter movies', style: TextStyle(color: Colors.white)), 
        backgroundColor: Colors.black
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              minWidth: 100,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('DashBoard'),
                ),
                NavigationRailDestination(
                  icon: Badge(child: Icon(Icons.list)),
                  label: Text('List'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: _widgetOptions[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}