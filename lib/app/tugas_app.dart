import 'package:flutter/material.dart';

import '../screens/task_list_screen.dart';

class TugasApp extends StatelessWidget {
  const TugasApp({super.key});

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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      home: const TaskListScreen(),
    );
  }
}
