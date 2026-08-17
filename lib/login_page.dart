import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup_page.dart';

// Login page receives the current theme information
// and the function that changes the theme.
class LoginPage extends StatefulWidget {

  // Stores whether Dark Mode is currently ON.
  final bool darkMode;

  // Function received from MyApp to change the theme.
  final Function(bool) onDarkModeChanged;

  const LoginPage({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // These variables temporarily store the registered account.
  String registeredEmail = 'nargis@gmail.com';
  String registeredPassword = '12345';

  // -----------------------------
  // CONTROLLERS
  // -----------------------------

  // Reads email entered by the user
  final TextEditingController emailController =
  TextEditingController();

  // Reads password entered by the user
  final TextEditingController passwordController =
  TextEditingController();


  // -----------------------------
  // PASSWORD VISIBILITY
  // -----------------------------

  // false = password hidden
  // true = password visible
  bool passwordVisible = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Center(

          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                children: [

                  // -----------------------------
                  // LOGIN ICON
                  // -----------------------------

                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 25),


                  // -----------------------------
                  // WELCOME TEXT
                  // -----------------------------

                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Login to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 35),


                  // -----------------------------
                  // EMAIL FIELD
                  // -----------------------------

                  TextField(

                    controller: emailController,

                    decoration: InputDecoration(

                      labelText: 'Email',

                      hintText: 'Enter your email',

                      prefixIcon: const Icon(
                        Icons.email,
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),


                  // -----------------------------
                  // PASSWORD FIELD
                  // -----------------------------

                  TextField(

                    controller: passwordController,

                    obscureText: !passwordVisible,

                    decoration: InputDecoration(

                      labelText: 'Password',

                      hintText: 'Enter your password',

                      prefixIcon: const Icon(
                        Icons.lock,
                      ),

                      // 👁️ Show / Hide password
                      suffixIcon: IconButton(

                        onPressed: () {

                          setState(() {

                            passwordVisible =
                            !passwordVisible;

                          });
                        },

                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),


                  // -----------------------------
                  // FORGOT PASSWORD
                  // -----------------------------

                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(

                      onPressed: () {

                        // We will create
                        // Forgot Password later.

                      },

                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),


                  // -----------------------------
                  // LOGIN BUTTON
                  // -----------------------------

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(

                      onPressed: () {

                        String email =
                            emailController.text;

                        String password =
                            passwordController.text;

                        // Check login details
                        if (email ==
                            registeredEmail &&
                            password == registeredPassword) {

                          // Correct login
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                // Send the REAL current Dark Mode value.
                                darkMode: widget.darkMode,

                                // Send MyApp's theme-changing function.
                                onDarkModeChanged: widget.onDarkModeChanged,
                              ),
                            ),
                          );

                        } else {

                          // Wrong login
                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            const SnackBar(
                              content: Text(
                                '❌ Invalid email or password',
                              ),
                            ),
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(

                        backgroundColor: Colors.blue,

                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 20),


                  // -----------------------------
                  // SIGN UP
                  // -----------------------------

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account? ",
                      ),

                      TextButton(
                        onPressed: () async {

                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );

                          if (result != null) {

                            setState(() {
                              registeredEmail = result['email'];
                              registeredPassword = result['password'];
                            });

                            emailController.text = registeredEmail;
                            passwordController.text = registeredPassword;
                          }
                        },

                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}