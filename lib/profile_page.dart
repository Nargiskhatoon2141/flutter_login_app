import 'package:flutter/material.dart';

// This creates our Profile page.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------------------
      // APP BAR
      // --------------------------------

      appBar: AppBar(
        title: const Text('Profile'),
      ),

      // --------------------------------
      // PAGE BODY
      // --------------------------------

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const SizedBox(height: 30),

            // --------------------------------
            // PROFILE ICON
            // --------------------------------

            const CircleAvatar(
              radius: 55,

              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            // --------------------------------
            // USER NAME
            // --------------------------------

            const Text(
              'Nargis',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // --------------------------------
            // EMAIL
            // --------------------------------

            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('nargis@gmail.com'),
            ),

            const Divider(),

            // --------------------------------
            // USER INFORMATION
            // --------------------------------

            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              subtitle: Text('Student Account'),
            ),
          ],
        ),
      ),
    );
  }
}