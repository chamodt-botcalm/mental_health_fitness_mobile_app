import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/feeling.dart';
import '../components/task_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Base dimensions (design reference)
    const double baseWidth = 375;
    const double baseHeight = 812;

    // Scale factors
    final double scaleFactor = screenWidth / baseWidth;
    final double heightScaleFactor = screenHeight / baseHeight;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: 30 * heightScaleFactor,
                left: 15 * scaleFactor,
                right: 15 * scaleFactor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'lib/assets/images/Hamburger.svg',
                        width: 22 * scaleFactor,
                        height: 18 * scaleFactor,
                        placeholderBuilder: (BuildContext context) =>
                            Icon(Icons.menu),
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'lib/assets/images/Profile.png',
                        width: 35 * scaleFactor,
                        height: 35 * scaleFactor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 109 * heightScaleFactor,
                left: 25 * scaleFactor,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontSize: 30 * scaleFactor,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Welcome back, ',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Sarina!',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 182 * scaleFactor,
                left: 25 * scaleFactor,
                child: Text(
                  'How are you feeling today ?',
                  style: TextStyle(
                    fontFamily: 'Alegreya',
                    fontSize: 22 * scaleFactor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 231 * scaleFactor,
                left: 25 * scaleFactor,
                child: Feeling(),
              ),
              Positioned(
                top: 365 * scaleFactor,
                left: 25 * scaleFactor,
                child: Text(
                  'Today’s Task',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'AlegreyaSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 410 * scaleFactor,
                left: 25 * scaleFactor,
                right: 25 * scaleFactor,
                bottom: 0,
                child: TaskCards(),
              ),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        // Added the hamburger menu drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to home or close drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page (you can create a SettingsScreen widget)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            // Add more ListTiles as needed
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.power_settings_new, 1),
            _buildNavItem(Icons.group, 2),
            _buildNavItem(Icons.settings, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? Color(0xFF6C63FF) : Colors.grey,
        ),
      ),
    );
  }
}

// Example SettingsScreen (add this to your file or a separate file)
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page')),
    );
  }
}
