import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'courses_page.dart';
import 'settings_page.dart';
import 'about_page.dart';

// This page receives the current theme information
// from the main application.
class HomePage extends StatelessWidget {

  final bool darkMode;
  final Function(bool) onDarkModeChanged;

  const HomePage({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Welcome message
            const Text(
              '👋 Welcome!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'What would you like to do today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Dashboard cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [

                  // Profile
                  _dashboardCard(
                    icon: Icons.person,
                    title: 'Profile',
                    // Open Profile page when the card is tapped
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );

                    },
                  ),

                  // Courses
                  _dashboardCard(
                    icon: Icons.menu_book,
                    title: 'Courses',
                    // Open Courses page when the card is tapped
                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => const CoursesPage(),
                        ),
                      );

                    },
                  ),

                  // Settings card
                  _dashboardCard(
                    icon: Icons.settings,
                    title: 'Settings',

                    // Open Settings page when the card is tapped.
                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => SettingsPage(

                            // Send current Dark Mode status.
                            darkMode: darkMode,

                            // Send the function that changes the theme.
                            onDarkModeChanged: onDarkModeChanged,
                          ),
                        ),
                      );

                    },
                  ),

                  // About Card
                  _dashboardCard(
                    icon: Icons.info,
                    title: 'About',

                    // Open About page.
                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Reusable dashboard card
  Widget _dashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(12),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}