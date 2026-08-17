import 'package:flutter/material.dart';

// This page receives the current dark mode value
// and a function that can change the app theme.
class SettingsPage extends StatefulWidget {
  final bool darkMode;
  final Function(bool) onDarkModeChanged;

  const SettingsPage({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}


// This class contains the changing settings.
class _SettingsPageState extends State<SettingsPage> {

  // --------------------------------
  // SETTINGS VARIABLES
  // --------------------------------

  // Stores whether dark mode is ON or OFF.
  // bool darkMode = false; //remove : Because darkMode now comes from MyApp.

  // Stores whether notifications are ON or OFF.
  bool notifications = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------------------
      // APP BAR
      // --------------------------------

      appBar: AppBar(
        title: const Text('Settings'),
      ),

      // --------------------------------
      // PAGE BODY
      // --------------------------------

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          // --------------------------------
          // APPEARANCE SECTION
          // --------------------------------

          const Text(
            'Appearance',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------
          // DARK MODE
          // --------------------------------

          Card(
            child: SwitchListTile(
              title: const Text('Dark Mode'),

              subtitle: const Text(
                'Change the app appearance',
              ),

              secondary: const Icon(
                Icons.dark_mode,
              ),

              // Current switch value
              // Show the current Dark Mode value.
              value: widget.darkMode,

              onChanged: (value) {
                setState(() {});

                widget.onDarkModeChanged(value);
              },
            ),
          ),

          const SizedBox(height: 25),

          // --------------------------------
          // NOTIFICATION SECTION
          // --------------------------------

          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------
          // NOTIFICATION SWITCH
          // --------------------------------

          Card(
            child: SwitchListTile(
              title: const Text('Notifications'),

              subtitle: const Text(
                'Receive app notifications',
              ),

              secondary: const Icon(
                Icons.notifications,
              ),

              // Current switch value
              value: notifications,

              // Runs when switch changes
              onChanged: (value) {

                // Update notification setting
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          const SizedBox(height: 25),

          // --------------------------------
          // ACCOUNT SECTION
          // --------------------------------

          const Text(
            'Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------
          // CHANGE PASSWORD
          // --------------------------------

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.lock,
              ),

              title: const Text(
                'Change Password',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {

                // For now, simply show a message.
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Change Password clicked',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}