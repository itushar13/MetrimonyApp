import 'package:flutter/material.dart';
import 'package:mmapp/profile_screen.dart';
import 'package:mmapp/explore_screen.dart';
import 'package:mmapp/inbox_screen.dart';
import 'package:mmapp/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrimony UI Prototype',
      theme: ThemeData(
        primaryColor: const Color(0xFFE11D48),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE11D48)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ProfileScreen(),
    ExploreLikesScreen(),
    InboxScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return; // Placeholder for center button
    setState(() {
      _selectedIndex = index > 2 ? index - 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.apps, color: Colors.white),
        backgroundColor: const Color(0xFFE11D48),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBottomNavItem(Icons.people_outline, 'Profiles', _selectedIndex == 0, () => _onItemTapped(0)),
            _buildBottomNavItem(Icons.grid_view, 'Explore', _selectedIndex == 1, () => _onItemTapped(1)),
            const SizedBox(width: 48), // Space for FAB
            _buildBottomNavItem(Icons.chat_bubble_outline, 'Inbox', _selectedIndex == 2, () => _onItemTapped(3)),
            _buildBottomNavItem(Icons.menu, 'Menu', _selectedIndex == 3, () => _onItemTapped(4)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected, VoidCallback onTap) {
    final color = isSelected ? Theme.of(context).primaryColor : Colors.grey.shade600;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
