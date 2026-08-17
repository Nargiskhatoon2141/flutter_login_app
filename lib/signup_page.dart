import 'package:flutter/material.dart';

// StatefulWidget because we will work with
// user-entered information.
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}


// This class contains the changing state
// of the Signup page.
class _SignupPageState extends State<SignupPage> {

  // --------------------------------
  // CONTROLLERS
  // --------------------------------

  // Reads the name entered by the user
  final TextEditingController nameController =
  TextEditingController();

  // Reads the email entered by the user
  final TextEditingController emailController =
  TextEditingController();

  // Reads the password entered by the user
  final TextEditingController passwordController =
  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --------------------------------
      // APP BAR
      // --------------------------------

      appBar: AppBar(
        title: const Text('Create Account'),
      ),


      // --------------------------------
      // PAGE BODY
      // --------------------------------

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              children: [

                const SizedBox(height: 30),


                // --------------------------------
                // TITLE
                // --------------------------------

                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),


                // --------------------------------
                // NAME
                // --------------------------------

                TextField(
                  // Connect the TextField to our controller
                  controller: nameController,

                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',

                    prefixIcon: const Icon(
                      Icons.person,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                // --------------------------------
                // EMAIL
                // --------------------------------

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',

                    prefixIcon: const Icon(
                      Icons.email,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                // --------------------------------
                // PASSWORD
                // --------------------------------

                TextField(
                  controller: passwordController,

                  // Hide password characters
                  obscureText: true,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',

                    prefixIcon: const Icon(
                      Icons.lock,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                // --------------------------------
                // CREATE ACCOUNT BUTTON
                // --------------------------------

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {

                      // Read what the user typed
                      String name =
                      nameController.text.trim();

                      String email =
                      emailController.text.trim();

                      String password =
                          passwordController.text;


                      // --------------------------------
                      // CHECK EMPTY FIELDS
                      // --------------------------------

                      if (name.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty) {

                        // Show error message
                        ScaffoldMessenger.of(context)
                            .showSnackBar(

                          const SnackBar(
                            content: Text(
                              '❌ Please fill all fields',
                            ),
                          ),
                        );

                        return;
                      }


                      // --------------------------------
                      // ACCOUNT CREATED
                      // --------------------------------

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content: Text(
                            '✅ Account created successfully!',
                          ),
                        ),
                      );


                      // Wait a little before going back
                      // to the Login page.
                      Future.delayed(
                        const Duration(seconds: 1),
                            () {
                          if (mounted) {
                            Navigator.pop(
                              context,
                              {
                                'email': email,
                                'password': password,
                              },
                            );
                          }
                        },
                      );
                    },

                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}