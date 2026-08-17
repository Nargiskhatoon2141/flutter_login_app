import 'package:flutter/material.dart';

// This creates the Courses page.
class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------------------
      // APP BAR
      // --------------------------------

      appBar: AppBar(
        title: const Text('Courses'),
      ),

      // --------------------------------
      // PAGE BODY
      // --------------------------------

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          // --------------------------------
          // PAGE TITLE
          // --------------------------------

          const Text(
            'My Courses',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // --------------------------------
          // COURSE 1
          // --------------------------------

          _courseCard(
            icon: Icons.code,
            title: 'Flutter Development',
            description: 'Learn to build mobile applications.',
          ),

          const SizedBox(height: 15),

          // --------------------------------
          // COURSE 2
          // --------------------------------

          _courseCard(
            icon: Icons.web,
            title: 'Web Development',
            description: 'Learn HTML, CSS and JavaScript.',
          ),

          const SizedBox(height: 15),

          // --------------------------------
          // COURSE 3
          // --------------------------------

          _courseCard(
            icon: Icons.analytics,
            title: 'Data Analytics',
            description: 'Learn how to analyze and understand data.',
          ),

          const SizedBox(height: 15),

          // --------------------------------
          // COURSE 4
          // --------------------------------

          _courseCard(
            icon: Icons.smart_toy,
            title: 'Agentic AI',
            description: 'Learn about AI agents and automation.',
          ),
        ],
      ),
    );
  }


  // --------------------------------
  // REUSABLE COURSE CARD
  // --------------------------------

  Widget _courseCard({
    required IconData icon,
    required String title,
    required String description,
  }) {

    return Card(
      elevation: 4,

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Row(
          children: [

            // Course icon
            Icon(
              icon,
              size: 45,
            ),

            const SizedBox(width: 20),

            // Course information
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // Course name
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Course description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}