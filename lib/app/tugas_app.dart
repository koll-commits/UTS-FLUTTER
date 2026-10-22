import 'package:flutter/material.dart';

import '../screens/task_list_screen.dart';

class TugasApp extends StatefulWidget {
  const TugasApp({super.key});

  @override
  State<TugasApp> createState() => _TugasAppState();
}

class _TugasAppState extends State<TugasApp> {
  // UTS 14 Oktober 2026 - Menambahkan AppBar, DarkMode dan LightMode
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color darkblue = Color(0xFF091540);
    const Color lightblue = Color(0xFF1B2CC1);

    return MaterialApp(
      title: 'Tugas Praktikum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: lightblue,
          primary: darkblue,
          secondary: lightblue,
          surface: const Color(0xFFF7F8FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F8FA),
          foregroundColor: darkblue,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE7EBEF)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: lightblue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F1220),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F1220),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A1E30),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFF2A3045)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1E30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      themeMode: _themeMode,
      home: TaskListScreen(
        themeMode: _themeMode, 
        onToggleTheme: _toggleTheme
      ),
    );
  }
}
