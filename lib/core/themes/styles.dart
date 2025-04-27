import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      // Primary color configuration
      primaryColor: const Color.fromARGB(255, 222, 64, 64),  // Your primary color
      primarySwatch: Colors.red,  // Optional: Automatically generate shades of primary color

      // Customize TextField
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Primary color for focused TextField border
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Primary color for TextField border
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Default border color
          ),
        ),
      ),
      
      // Customize TextField's cursor color
      textSelectionTheme:const TextSelectionThemeData(
        cursorColor:  Color.fromARGB(255, 222, 64, 64), // Primary color for cursor
      ),
      
      // Customize TextField's text selection color
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),  // Set default text color here
      ),
      
      // Customize AppBar and button color
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 222, 64, 64),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(255, 222, 64, 64),
      ),

      // Add other common theme elements like scaffold background, card themes, etc.
      scaffoldBackgroundColor: Colors.white,  // Background color of the whole scaffold
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 5,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      // Define dark theme primary color
      primaryColor: const Color.fromARGB(255, 222, 64, 64),
      primarySwatch: Colors.red,

      // Customize TextField in dark theme
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Primary color for focused TextField border
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Primary color for TextField border
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 64, 64), // Default border color
          ),
        ),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor:  Color.fromARGB(255, 222, 64, 64), // Primary color for cursor
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),  // Set default text color here for dark theme
      ),

      // Customize AppBar and button color for dark theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 222, 64, 64),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(255, 222, 64, 64),
      ),

      // Dark theme background and other UI elements
      scaffoldBackgroundColor: Colors.black,  // Dark theme background
      cardTheme: CardTheme(
        color: Colors.grey[850],
        elevation: 5,
      ),
    );
  }
}
