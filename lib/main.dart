import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/screens/task_dashboard_view.dart';
import 'view/screens/task_create_edit_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: GoogleFonts.dmSansTextTheme,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: TaskCreateEditView(),
      ),
    );
  }
}
