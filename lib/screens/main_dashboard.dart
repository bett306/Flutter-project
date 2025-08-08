import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'saved_options_screen.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: isWideScreen
          ? null // No AppBar for wide screens
          : AppBar(title: const Text('Youth Opportunity Hub')),
      drawer: isWideScreen
          ? null // No drawer for wide screens
          : Drawer(child: _buildSidebarContent(context)),
      body: isWideScreen
          ? Row(
              children: [
                // Permanent sidebar
                Container(
                  width: 250,
                  color: Colors.blueGrey[900],
                  child: _buildSidebarContent(context),
                ),
                // Main content area
                const Expanded(
                  child: Center(
                    child: Text(
                      'Welcome to the Main Dashboard',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text(
                'Welcome to the Main Dashboard',
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.blueGrey),
          child: const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home, color: Colors.white),
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark, color: Colors.white),
          title: const Text(
            'Saved Options',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SavedOptionsScreen(bookmarkedItems: []),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications, color: Colors.white),
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            // Implement notifications page navigation
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.white),
          title: const Text('Settings', style: TextStyle(color: Colors.white)),
          onTap: () {
            // Implement settings page navigation
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.white),
          title: const Text('Log Out', style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
