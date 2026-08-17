import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  // Start the Flutter application.
  runApp(const MyApp());
}


// --------------------------------
// MAIN APP
// --------------------------------

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


// --------------------------------
// APP STATE
// --------------------------------

class _MyAppState extends State<MyApp> {

  // Stores whether Dark Mode is enabled.
  bool darkMode = false;


  // --------------------------------
  // CHANGE THEME
  // --------------------------------

  void changeTheme(bool value) {

    setState(() {
      darkMode = value;
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      // Remove the debug banner.
      debugShowCheckedModeBanner: false,

      // --------------------------------
      // LIGHT THEME
      // --------------------------------

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      // --------------------------------
      // DARK THEME
      // --------------------------------

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      // --------------------------------
      // SELECT THEME
      // --------------------------------

      themeMode: darkMode
          ? ThemeMode.dark
          : ThemeMode.light,

      // --------------------------------
      // FIRST PAGE
      // --------------------------------

      // Open Login page and give it access
      // to the app's theme information.
      home: LoginPage(
        // Send current theme status to Login.
        darkMode: darkMode,

        // Give Login the function that changes
        // the application's theme.
        onDarkModeChanged: changeTheme,
      ),
    );
  }
}