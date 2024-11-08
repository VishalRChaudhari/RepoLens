import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repolens/Screens/home.dart';

Color mycolor  = const Color(0xFF8BAAAD);
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: mycolor,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const Home(),
    );
  }
}
