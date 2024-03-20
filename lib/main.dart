import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_model/routes/route_paths.dart';
import 'view_model/routes/routes.dart';

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
        textTheme: GoogleFonts.dmSansTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.tasks_dashboard,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
