import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor

  // Brand Colors
  static const Color primary = Color(0xFF004DCF);
  static const Color secondary = Color(0xFF0D1B3E);

  // Background Colors
  static const Color lightBackground = Color(0xFFF9FAFB);
  static const Color darkBackground = Color(0xFF0F172A);

  static const Color lightSurface = Colors.white;
  static const Color darkSurface = Color(0xFF1E293B);

  // Text Colors
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF6B7280);

  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Border & Divider

  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color darkBorder = Color(0xFF334155);

  static const Color divider = Color(0xFFE2E8F0);

  // Disabled
  static const Color disabled = Color(0xFF9CA3AF);
}

/*
Usage:
Text('Flutter',style: TextStyle(color: AppColors.primary)
 */
