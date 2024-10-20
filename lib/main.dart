import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tindog_app/app_state.dart';
import 'package:tindog_app/pages/home.dart';
import 'package:tindog_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Tindog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          textTheme: GoogleFonts.akatabTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
