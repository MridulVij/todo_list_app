import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/repository/sql_database.dart';
import 'model/utils/local_notification.dart';
import 'view_model/cubit/todo_cubit.dart';
import 'view_model/routes/route_paths.dart';
import 'view_model/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await LocalNotifications.init();
  await SQLDatabase().initializeDatabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // bloc disabled
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(),
          useMaterial3: false,
        ),
        initialRoute: RoutesName.tasks_dashboard,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
