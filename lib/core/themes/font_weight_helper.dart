import 'package:flutter/material.dart';

class AppFonts {
  // Regular font style
  static const TextStyle regular = TextStyle(
    fontFamily: 'Poppins', // TikTok uses Poppins or a similar sans-serif font
    fontWeight: FontWeight.w400, // Regular weight
    fontSize: 14.0, // Standard font size
    color: Colors.white
      );

  // Bold font style for headings, buttons, and important text
  static const TextStyle bold = TextStyle(
    fontFamily: 'Poppins', // Same font family for consistency
    fontWeight: FontWeight.w700, // Bold weight
    fontSize: 16.0, // Slightly larger for emphasis
  );

  // Extra bold font style for titles or very important text
  static const TextStyle extraBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800, // Extra bold for titles
    fontSize: 20.0, // Larger size for titles
  );

  // Semi-bold font style for subheadings or slightly emphasized text
  static const TextStyle semiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // Semi-bold weight for subheadings
    fontSize: 16.0, // Same as bold but with less emphasis
  );

  // Light font style for captions or subtle text
  static const TextStyle light = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300, // Light weight for subtle text
    fontSize: 14.0, // Standard font size for captions
  );

  // Italic font style for emphasis in specific cases (like quotes or highlights)
  static const TextStyle italic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400, // Regular weight but italicized
    fontStyle: FontStyle.italic,
    fontSize: 14.0, // Standard font size
  );

  // Caption font style for fine print or small text
  static const TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300, // Light weight for small text
    fontSize: 12.0, // Smaller size for captions
    color: Color(0xFF666666), // Slightly grayish for less emphasis
  );

  // Button font style
  static const TextStyle button = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // Semi-bold weight for buttons
    fontSize: 14.0, // Button font size
    color: Colors.white, // White text for buttons
  );

  // Title font style for screen or section titles
  static const TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700, // Bold weight for titles
    fontSize: 18.0, // Larger font size for titles
  );

  
  // Head font style for main headings or important sections
  static const TextStyle head = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800, 
    fontSize: 32.0, // Larger font size for headings
  );
}
