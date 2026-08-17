import 'package:flutter/material.dart';

// --------------------------------
// ABOUT PAGE
// --------------------------------

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------------------
      // APP BAR
      // --------------------------------

      appBar: AppBar(
        title: const Text('About'),
      ),

      // --------------------------------
      // PAGE BODY
      // --------------------------------

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // --------------------------------
              // APP ICON
              // --------------------------------

              Container(
                width: 100,
                height: 100,

                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.phone_android,
                  size: 55,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              // --------------------------------
              // APP NAME
              // --------------------------------

              const Text(
                'My Login App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // --------------------------------
              // DESCRIPTION
              // --------------------------------

              const Text(
                'A Flutter practice application '
                    'created to learn mobile app development.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // --------------------------------
              // DEVELOPER
              // --------------------------------

              const Text(
                'Developed by Nargis',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // --------------------------------
              // VERSION
              // --------------------------------

              const Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // --------------------------------
              // BACK BUTTON
              // --------------------------------

              ElevatedButton.icon(
                onPressed: () {

                  // Return to the previous page.
                  Navigator.pop(context);

                },

                icon: const Icon(
                  Icons.arrow_back,
                ),

                label: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}