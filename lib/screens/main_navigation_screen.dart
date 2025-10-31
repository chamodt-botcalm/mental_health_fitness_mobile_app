import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:remix_ic/remix_ic.dart';
import 'home_screen.dart';
import 'main_screen.dart';
import 'sound_screen.dart' as sound;
import 'settings_screen.dart' as settings;

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      MainScreen(scaffoldKey: _scaffoldKey),
      sound.SoundScreen(),
      Container(), // Placeholder for third tab
      settings.SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final isTablet = screenWidth > 600;

    double bottomNavigationHeight = 85;

    const double baseWidth = 375;
    const double baseHeight = 812;

    double scaleFactor = isTablet
        ? 1.0
        : (screenWidth / baseWidth).clamp(0.8, 1.2);
    double heightScaleFactor = isTablet
        ? 1.0
        : (screenHeight / baseHeight).clamp(0.8, 1.2);

    if (isLandscape) {
      bottomNavigationHeight =
          80 * ((screenHeight / baseHeight).clamp(0.8, 1.2));
    }

    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFAEAFF7)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: bottomNavigationHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Remix.home4Fill, 0),
            _buildNavItem(MaterialCommunityIcons.music_circle, 1),
            _buildNavItem(Remix.group2Fill, 2),
            _buildNavItem(Remix.settings3Fill, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
